library(asbio)


### Name: r.dist
### Title: Visualize the sampling distribution of Pearson's product moment
###   correlation
### Aliases: r.dist see.r.dist.tck
### Keywords: graphs

### ** Examples

dev.new(height=3.5)
op <- par(mfrow=c(1,2),mar=c (0,0,1.5,3), oma = c(5, 4.2, 0, 0))
vals <- r.dist(0.9, seq(-1, 1, .001), 5)
plot(seq(-1, 1, .001), vals, type = "l",ylab = "", xlab = "")
vals <- r.dist(0.5, seq(-1, 1, .001), 5)
lines(seq(-1, 1, .001), vals, lty = 2)
vals <- r.dist(0.0, seq(-1, 1, .001), 5)
lines(seq(-1, 1, .001), vals, lty = 3)
legend("topleft", lty = c(1, 2, 3), title = expression(paste(italic(n)," = 5")), 
legend = c(expression(paste(rho, " = 0.9")),expression(paste(rho, " = 0.5")),
expression(paste(rho, " = 0"))),bty = "n") 

vals <- r.dist(0.9, seq(-1, 1, .001), 30)
plot(seq(-1, 1, .001), vals, type = "l",xlab= "", ylab= "")
vals <- r.dist(0.5, seq(-1, 1, .001), 30)
lines(seq(-1, 1, .001), vals, lty = 2)
vals <- r.dist(0.0, seq(-1, 1, .001), 30)
lines(seq(-1, 1, .001), vals, lty = 3)
legend("topleft", lty = c(1, 2, 3), title = expression(paste(italic(n)," = 30")), 
legend = c(expression(paste(rho, " = 0.9")),expression(paste(rho, " = 0.5")),
expression(paste(rho, " = 0"))), bty = "n") 
mtext(side = 2, expression(paste(italic(f),"(",italic(r),")")), outer = TRUE, line = 3)
mtext(side = 1, expression(italic(r)), outer = TRUE, line = 3, at = .45)
par(op)



