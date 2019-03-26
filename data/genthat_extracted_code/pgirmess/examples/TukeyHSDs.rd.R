library(pgirmess)


### Name: TukeyHSDs
### Title: Simplify the list of a TukeyHSD object keeping the significant
###   differences only.
### Aliases: TukeyHSDs
### Keywords: htest

### ** Examples


     summary(fm1 <- aov(breaks ~ wool + tension, data = warpbreaks))
     myobject<-TukeyHSD(fm1, "tension", ordered = TRUE)
     myobject
     TukeyHSDs(myobject)
  


