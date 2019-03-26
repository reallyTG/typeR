library(sfsmisc)


### Name: plotDS
### Title: Plot Data and Smoother / Fitted Values
### Aliases: plotDS
### Keywords: hplot

### ** Examples

 data(cars)
 x <-  cars$speed
 yd <- cars$dist
 ys <- lowess(x, yd, f = .3)$y
 plotDS(x, yd, ys)

 ## More interesting : Version of example(Theoph)
 data(Theoph)
 Th4 <- subset(Theoph, Subject == 4)
 ## just for "checking" purposes -- permute the observations:
 Th4 <- Th4[sample(nrow(Th4)), ]
 fm1 <- nls(conc ~ SSfol(Dose, Time, lKe, lKa, lCl), data = Th4)

 ## Simple
 plotDS(Th4$Time, Th4$conc, fitted(fm1),
        sub  = "Theophylline data - Subject 4 only",
        segP = list(lty=1,col=2), las = 1)

 ## Nicer: Draw the smoother not only at x = x[i] (observations):
 xsm <- unique(sort(c(Th4$Time, seq(0, 25, length = 201))))
 ysm <- c(predict(fm1, newdata = list(Time = xsm)))
 plotDS(Th4$Time, Th4$conc, ys = list(x=xsm, y=ysm),
        sub  = "Theophylline data - Subject 4 only",
        segP = list(lwd=2), las = 1)



