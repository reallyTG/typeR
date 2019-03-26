library(astroFns)


### Name: b2j
### Title: B1950 to J2000 coordinate conversion
### Aliases: b2j
### Keywords: misc

### ** Examples

b2j()
b2j(ra='17, 43', dec='-28, 47, 30')
b2j(ra='17, 43', dec=' -  28,  47, 30')
b2j(ra='17h43m', dec='-28d47m30s')
tmp <- b2j(ra='17, 43', dec=' -  28,  47, 30')
str(tmp)
tmp



