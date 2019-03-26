library(FSAdata)


### Name: TPrawnsEG
### Title: Stock and recruitment data for Exmouth Gulf Tiger Prawn,
###   1970-83.
### Aliases: TPrawnsEG
### Keywords: datasets

### ** Examples

data(TPrawnsEG)
str(TPrawnsEG)
head(TPrawnsEG)
op <- par(mfrow=c(1,2),pch=19)
plot(recruits~year,data=TPrawnsEG,type="l")
plot(recruits~stock,data=TPrawnsEG)
par(op)





