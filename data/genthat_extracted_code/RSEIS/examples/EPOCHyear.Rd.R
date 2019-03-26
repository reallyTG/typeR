library(RSEIS)


### Name: EPOCHyear
### Title: Epoch Year
### Aliases: EPOCHyear
### Keywords: misc

### ** Examples



tyears   <-  1973:2009

E1  <-  EPOCHday(tyears, jd=1,   origyr=1972       )

EPOCHyear(E1$jday,   origyr=1972  )

#######  here is an example using year Month and day of month
###  use March 19 for each year:
ii  <-  tojul(tyears, 3, 19)-tojul(tyears, 1, 1)

E1  <-  EPOCHday(tyears, jd=ii,  origyr=1972       )

EPOCHyear(E1$jday,   origyr=1972  )






