library(csabounds)


### Name: E.Y1
### Title: E.Y1
### Aliases: E.Y1

### ** Examples

data(displacements)
ytmin1 <- 10
Y1t <- subset(displacements, year==2011 & treat==1)$learn
Y0tmin1 <- subset(displacements, year==2007 & treat==1)$learn
E.Y1(ytmin1, Y1t, Y0tmin1)




