library(dagitty)


### Name: dconnected
### Title: d-Separation
### Aliases: dconnected dseparated

### ** Examples

dconnected( "dag{x->m->y}", "x", "y", c() ) # TRUE
dconnected( "dag{x->m->y}", "x", "y", c("m") ) # FALSE
dseparated( "dag{x->m->y}", "x", "y", c() ) # TRUE
dseparated( "dag{x->m->y}", "x", "y", c("m") ) # FALSE




