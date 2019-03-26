library(csabounds)


### Name: F.Y1
### Title: F.Y1
### Aliases: F.Y1

### ** Examples

data(displacements)
ytmin1 <- 10
Y1t <- subset(displacements, year==2011 & treat==1)$learn
Y0tmin1 <- subset(displacements, year==2007 & treat==1)$learn
y.seq <- seq(min(c(Y0tmin1,Y1t)), max(c(Y0tmin1,Y1t)), length.out=100)
F.Y1(ytmin1, y.seq, Y1t, Y0tmin1)




