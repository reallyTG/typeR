library(fullfact)


### Name: buildMulti
### Title: Convert to a multinomial frame
### Aliases: buildMulti

### ** Examples

data(chinook_survival)
chinook_survival$total<- chinook_survival$alive + chinook_survival$dead #create total column
chinook_survival3<- buildMulti(dat=chinook_survival,copy=c(1:6,9),multi=list(c(2,1,0),
c("total","alive","dead")))



