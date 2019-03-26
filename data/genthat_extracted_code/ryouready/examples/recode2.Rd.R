library(ryouready)


### Name: recode2
### Title: Wrapper for 'recode' from 'car' to allow to recode multiple
###   columns at once
### Aliases: recode2

### ** Examples

a <- attitude
rec <- "0:50=1; 51:70=2; 60:100=3; else=NA"
recode2(a, recodes=rec)
recode2(a, vars=1:2, recodes=rec)
recode2(a, vars=c("rating", "complaints"), recodes=rec)



