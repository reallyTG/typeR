library(MCPAN)


### Name: summary.binomRRci
### Title: Detailed print out for binomRRci
### Aliases: summary.binomRRci
### Keywords: print

### ** Examples




data(liarozole)

head(liarozole)

LiDu<-binomRRci(Improved ~ Treatment, data=liarozole,
 type="Dunnett", alternative="greater")

LiDu

summary(LiDu)






