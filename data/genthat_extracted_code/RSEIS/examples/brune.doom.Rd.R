library(RSEIS)


### Name: brune.doom
### Title: Brune Modeling
### Aliases: brune.doom
### Keywords: misc hplot

### ** Examples


data(CE1)
plot(CE1$x, CE1$y, type='l')
Xamp = CE1$y[CE1$x>5.443754 & CE1$x<5.615951]

BF = brune.doom( Xamp, CE1$dt ,f1=.5, f2=12 ,  PLOTB = TRUE)




