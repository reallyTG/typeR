library(lfstat)


### Name: Qxx
### Title: Qxx, Q95, Q90, Q70
### Aliases: Q95 Qxx Q70 Q90

### ** Examples

data(ngaruroro)
Q95(ngaruroro)
Q95(ngaruroro, breakdays = c("01/11","01/05"))
Q95(ngaruroro, year = 1991)
#Calculate Q99
Qxx(ngaruroro, Qxx = 99)



