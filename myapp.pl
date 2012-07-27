#!/usr/bin/env perl

package MojoLite::I18N;
use strict;
use warnings;
use utf8;
use parent 'Locale::Maketext';

package MojoLite::I18N::es;
use utf8;
use Mojo::Base 'MojoLite::I18N';

our %Lexicon = (
	'Welcome' => 'Bienvenido',
	'Can translate text in Mojolicious::Lite!' => '¡Se puede traducir texto en Mojolicious::Lite!' ,
);

package main;
use Mojolicious::Lite;
# Documentation browser under "/perldoc"
plugin 'PODRenderer';
plugin I18N => {namespace => 'MojoLite::I18N', default => 'es'};

get '/' => sub {
  my $self = shift;
  $self->render('index');
};

app->start;
__DATA__

@@ index.html.ep
% layout 'default';
% title l 'Welcome';
<%= l 'Can translate text in Mojolicious::Lite!' %>

@@ layouts/default.html.ep
<!DOCTYPE html>
<html>
  <head><title><%= title %></title></head>
  <body><%= content %></body>
</html>
