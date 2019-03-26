library(ensembleBMA)


### Name: julTOymdh
### Title: Convert Julian dates to character format.
### Aliases: julTOymdh
### Keywords: chron

### ** Examples

  data(ensBMAtest)

  julianIdates <- ymdhTOjul(ensBMAtest$idate)

  all.equal( julTOymdh(julianIdates), as.character(ensBMAtest$idate))

  all.equal( ymdhTOjul(ensBMAtest$vdate), julianIdates+2)



