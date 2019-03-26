library(rccmisc)


### Name: cut.integer
### Title: Convert integer vector to Factor
### Aliases: cut.integer

### ** Examples

cut.default(1:100, seq(0, 100, 20)) # Gives a quite unnatural output
cut(1:100, seq(0, 100, 20)) # Gives nicer and ordered output
cut(1:10, 3) # no integer intervals and therefor same as cut.default



