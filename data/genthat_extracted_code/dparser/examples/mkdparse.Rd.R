library(dparser)


### Name: mkdparse
### Title: mkdparse dparser grammer c
### Aliases: mkdparse

### ** Examples


## This makes the ANSI c grammar file to parse C code:
mkdparse(system.file("ansic.test.g", package = "dparser"),"ansic_gram.c", grammar_ident="ascii_C");



