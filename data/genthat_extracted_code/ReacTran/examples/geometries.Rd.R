library(ReacTran)


### Name: g.sphere
### Title: Surface Area and Volume of Geometrical Objects
### Aliases: g.sphere g.spheroid g.cylinder
### Keywords: utilities

### ** Examples


 mf <- par(mfrow = c(3, 2))
 x  <- seq(from = 0, to = 1, length = 10)
 plot(x, g.sphere(x)$surf, main = "sphere surface")
 plot(x, g.sphere(x)$vol, main = "sphere volume")
 plot(x, g.spheroid(x, b = 0.5)$surf, main = "spheroid surface")
 plot(x, g.spheroid(x, b = 0.5)$vol, main = "spheroid volume")
 plot(x, g.cylinder(x, L = 1)$surf, main = "cylinder surface")
 plot(x, g.cylinder(x, L = 1)$vol, main = "cylinder volume")
 par("mfrow" = mf)




