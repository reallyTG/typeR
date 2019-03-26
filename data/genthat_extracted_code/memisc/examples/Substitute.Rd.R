library(memisc)


### Name: Substitute
### Title: Substitutions in Language Objects
### Aliases: Substitute
### Keywords: programming

### ** Examples

lang <- quote(sin(x)+z)
substitute(lang,list(x=1,z=2))
Substitute(lang,list(x=1,z=2))



