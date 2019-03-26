library(psych)


### Name: Harman
### Title: Five data sets from Harman (1967). 9 cognitive variables from
###   Holzinger and 8 emotional variables from Burt
### Aliases: Harman Harman.Burt Harman.Holzinger Harman.political Harman.5
###   Harman.8
### Keywords: datasets

### ** Examples

data(Harman)
cor.plot(Harman.Holzinger)
cor.plot(Harman.Burt)  
smc(Harman.Burt)  #note how this produces impossible results
f2 <- fa(Harman.8,2, rotate="none")  #minres matches Harman and Jones



