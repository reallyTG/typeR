library(ensembleBMA)


### Name: ymdhTOjul
### Title: Convert to Julian dates.
### Aliases: ymdhTOjul
### Keywords: chron

### ** Examples

  data(ensBMAtest)

  julianVdates <- ymdhTOjul(ensBMAtest$vdate)
  all.equal( julTOymdh(julianVdates), as.character(ensBMAtest$vdate))

  all.equal( ymdhTOjul(ensBMAtest$idate), julianVdates-2)



