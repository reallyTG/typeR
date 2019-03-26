library(FSAdata)


### Name: PSalmonAK
### Title: Stock and recruitment data for Alaskan Pink Salmon, 1960-1990.
### Aliases: PSalmonAK
### Keywords: datasets

### ** Examples

data(PSalmonAK)
str(PSalmonAK)
head(PSalmonAK)
op <- par(mfrow=c(1,2))
plot(return~year,data=PSalmonAK)
plot(return~escapement,data=PSalmonAK)
par(op)




