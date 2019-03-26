library(emdbook)


### Name: Fir
### Title: Data on fir (Abies) life history
### Aliases: Fir FirDBHFec FirDBHFec_sum
### Keywords: datasets

### ** Examples

data(FirDBHFec_sum)
attach(FirDBHFec_sum)
plot(DBH,fecundity,col=as.numeric(pop),pch=as.numeric(pop))
lms = lapply(split(FirDBHFec_sum,pop),lm,formula=fecundity~DBH)
for (i in 1:2) abline(lms[[i]],col=i)
detach(FirDBHFec_sum)



