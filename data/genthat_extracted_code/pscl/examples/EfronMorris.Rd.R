library(pscl)


### Name: EfronMorris
### Title: Batting Averages for 18 major league baseball players, 1970
### Aliases: EfronMorris
### Keywords: datasets

### ** Examples

data(EfronMorris)
attach(EfronMorris)
plot(p~y,
     xlim=range(p,y),
     ylim=range(p,y),
     xlab="Batting Average, 1st 45 at bats",
     ylab="Batting Average, Remainder of Season")
abline(0,1)



