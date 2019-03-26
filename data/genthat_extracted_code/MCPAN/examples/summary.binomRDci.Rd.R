library(MCPAN)


### Name: summary.binomRDci
### Title: Detailed print out for binomRDci
### Aliases: summary.binomRDci
### Keywords: print

### ** Examples




data(liarozole)

head(liarozole)

LiWi<-binomRDci(Improved ~ Treatment, data=liarozole,
 type="Williams")

LiWi

summary(LiWi)






