## ---- fig.width=7--------------------------------------------------------
library(ggplot2)
library(gridExtra)
library(grid)

# Sample a gaussian distribution, add noise to it
x       <- c(-4, -3, -2, -1.5, -1, -0.5, 0, 0.5,  1, 1.5, 2, 3, 4)
y       <- dnorm(x, mean = 0, sd = 1, log=FALSE)
y_noise <- jitter(y, 90)

# Fit different smoothing splines, project on a grid for plotting
time     = seq(-4, 4, 0.01 )
tmp_fit0 = smooth.spline(x, y, df=13)
tmp_fit1 = smooth.spline(x, y_noise, df=2)
tmp_fit2 = smooth.spline(x, y_noise, df=5)
tmp_fit3 = smooth.spline(x, y_noise, df=13)

pred0    = predict( object=tmp_fit0, x=time )
pred1    = predict( object=tmp_fit1, x=time )
pred2    = predict( object=tmp_fit2, x=time )
pred3    = predict( object=tmp_fit3, x=time )

tmpPred0 = data.frame( x=pred0$x, y=pred0$y)
tmpPred1 = data.frame( x=pred1$x, y=pred1$y)
tmpPred2 = data.frame( x=pred2$x, y=pred2$y)
tmpPred3 = data.frame( x=pred3$x, y=pred3$y)

tmpRaw   = data.frame( x=x,  y=y)
tmpNoisy = data.frame( x=x,  y=y_noise)

# Plot original data and spline representations
p0 <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + xlim(-4,4) + ylim(-0.1,0.5) + theme(axis.title.y = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank(), plot.margin=unit(c(0.5,0.25,0.5,0), "cm"))
p0 <- p0 + geom_point(data=tmpRaw, aes(x=x, y=y), size=1.5 )
p0 <- p0 + geom_line( data=tmpPred0, aes(x=x, y=y), linetype=1, color='springgreen3' )
p0 <- p0 + xlab(expression(atop('True underlying', paste('function of time'))))

p1 <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + xlim(-4,4) + ylim(-0.1,0.5) + theme(axis.title.y = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank(), plot.margin=unit(c(0.5,0.25,0.5,-0.25), "cm"))
p1 <- p1 + geom_point(data=tmpNoisy, aes(x=x, y=y), size=1.5 )
p1 <- p1 + geom_line( data=tmpPred1, aes(x=x, y=y), linetype=1, color='blue' )
p1 <- p1 + xlab(expression(atop(lambda*' -> '*infinity, paste('DF = 2'))))

p2 <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + xlim(-4,4) + ylim(-0.1,0.5) + theme(axis.title.y = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank(), plot.margin=unit(c(0.5,0.25,0.5,-0.25), "cm"))
p2 <- p2 + geom_point(data=tmpNoisy, aes(x=x, y=y), size=1.5 )
p2 <- p2 + geom_line( data=tmpPred2, aes(x=x, y=y), linetype=1, color='blue' )
p2 <- p2 + xlab(expression(atop('Optimal '*lambda, paste('Optimal DF', sep=''))))

p3 <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + xlim(-4,4) + ylim(-0.1,0.5) + theme(axis.title.y = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank(), plot.margin=unit(c(0.5,0.25,0.5,-0.25), "cm"))
p3 <- p3 + geom_point(data=tmpNoisy, aes(x=x, y=y), size=1.5 )
p3 <- p3 + geom_line( data=tmpPred3, aes(x=x, y=y), linetype=1, color='blue' )
p3 <- p3 + xlab(expression(atop(lambda*' = 0', paste('DF = N'))))

grid.arrange(p0,p1,p2,p3, ncol=4)

## ---- fig.width=7, echo=FALSE--------------------------------------------
library(ggplot2)
library(gridExtra)
library(grid)
library(santaR)

# A the underlying function of time -----------------
mat1            <- data.frame( matrix( c(rep(1,7),rep(2,7),rep(3,7),rep(4,7),rep(5,7),rep(6,7)), ncol=7, byrow=TRUE ))
rownames(mat1)  <- c('a','b','c','d','e','f')
colnames(mat1)  <- c(0,1,2,3,4,5,6)

A         <- santaR_fit( mat1, df=5)
# the points
pt_A      <- data.frame(A$groups[[1]]$point.in)   # the point
# the ind curve
tmpPt1    <- data.frame(predict(A$groups[[1]]$curveInd[[1]], seq( min(A$groups[[1]]$point.in$x), max(A$groups[[1]]$point.in$x), ((max(A$groups[[1]]$point.in$x)-min(A$groups[[1]]$point.in$x))/250) ) ) )
tmpPt2    <- data.frame(predict(A$groups[[1]]$curveInd[[2]], seq( min(A$groups[[1]]$point.in$x), max(A$groups[[1]]$point.in$x), ((max(A$groups[[1]]$point.in$x)-min(A$groups[[1]]$point.in$x))/250) ) ) )
tmpPt3    <- data.frame(predict(A$groups[[1]]$curveInd[[3]], seq( min(A$groups[[1]]$point.in$x), max(A$groups[[1]]$point.in$x), ((max(A$groups[[1]]$point.in$x)-min(A$groups[[1]]$point.in$x))/250) ) ) )
tmpPt4    <- data.frame(predict(A$groups[[1]]$curveInd[[4]], seq( min(A$groups[[1]]$point.in$x), max(A$groups[[1]]$point.in$x), ((max(A$groups[[1]]$point.in$x)-min(A$groups[[1]]$point.in$x))/250) ) ) )
tmpPt5    <- data.frame(predict(A$groups[[1]]$curveInd[[5]], seq( min(A$groups[[1]]$point.in$x), max(A$groups[[1]]$point.in$x), ((max(A$groups[[1]]$point.in$x)-min(A$groups[[1]]$point.in$x))/250) ) ) )
tmpPt6    <- data.frame(predict(A$groups[[1]]$curveInd[[6]], seq( min(A$groups[[1]]$point.in$x), max(A$groups[[1]]$point.in$x), ((max(A$groups[[1]]$point.in$x)-min(A$groups[[1]]$point.in$x))/250) ) ) )
# group mean curve
tmpMeanA  <- data.frame(predict(A$groups[[1]]$groupMeanCurve, seq( min(A$groups[[1]]$groupMeanCurve$x), max(A$groups[[1]]$groupMeanCurve$x), ((max(A$groups[[1]]$groupMeanCurve$x)-min(A$groups[[1]]$groupMeanCurve$x))/250) ) ) )

# plot 
p4        <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + theme(axis.title.y = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank(), plot.margin=unit(c(0.5,0.25,0.5,0), "cm"))  # init
p4        <- p4 + geom_point(data=pt_A, aes(x=x, y=y), size=2.5 )                                     # points
p4        <- p4 + geom_line( data=tmpPt1, aes(x=x, y=y), linetype=2, color='springgreen3' )           # ind
p4        <- p4 + geom_line( data=tmpPt2, aes(x=x, y=y), linetype=2, color='springgreen3' )           # ind
p4        <- p4 + geom_line( data=tmpPt3, aes(x=x, y=y), linetype=2, color='springgreen3' )           # ind
p4        <- p4 + geom_line( data=tmpPt4, aes(x=x, y=y), linetype=2, color='springgreen3' )           # ind
p4        <- p4 + geom_line( data=tmpPt5, aes(x=x, y=y), linetype=2, color='springgreen3' )           # ind
p4        <- p4 + geom_line( data=tmpPt6, aes(x=x, y=y), linetype=2, color='springgreen3' )           # ind
p4        <- p4 + geom_line( data=tmpMeanA, aes(x=x, y=y), linetype=1, size=1, col='springgreen3' )   # group mean curve
p4        <- p4 + xlab(expression(atop('True underlying', paste('function of time'))))

# B group mean fit from measurements ----------------
mat2            <- mat1
mat2$'2'[1:5]   <- NA           # drop some points
mat2$'4'[2:6]   <- NA           # drop more points

B         <- santaR_fit( mat2, df=5)
# fit a group mean curve on the points only
tmp_fitB  <- smooth.spline( B$groups[[1]]$point.in$x, B$groups[[1]]$point.in$y, df=5)
# the point
pt_B      <- data.frame(B$groups[[1]]$point.in)   # the point
# the group mean curve
time      <- seq( min(B$groups[[1]]$point.in$x), max(B$groups[[1]]$point.in$x), 0.1 )
predMeanB <- predict( object=tmp_fitB, x=time )
tmpPredB  <- data.frame( x=predMeanB$x, y=predMeanB$y)

# plot 
p5        <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + theme(axis.title.y = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank(), plot.margin=unit(c(0.5,0.25,0.5,-0.25), "cm"))  # init
p5        <- p5 + geom_point(data=pt_B, aes(x=x, y=y), size=2.5 )                                     # points
p5        <- p5 + geom_line( data=tmpPredB, aes(x=x, y=y), linetype=1, size=1, col='blue' )   # group mean curve
p5        <- p5 + xlab(expression(atop('Group mean curve based', paste('on observations'))))

# C group mean proper fit ---------------------------
C         <- santaR_fit( mat2, df=5)
# the point
pt_C      <- data.frame(C$groups[[1]]$point.in)
# the ind curve
tmpPt7    <- data.frame(predict(C$groups[[1]]$curveInd[[1]], seq( min(C$groups[[1]]$point.in$x), max(C$groups[[1]]$point.in$x), ((max(C$groups[[1]]$point.in$x)-min(C$groups[[1]]$point.in$x))/250) ) ) )
tmpPt8    <- data.frame(predict(C$groups[[1]]$curveInd[[2]], seq( min(C$groups[[1]]$point.in$x), max(C$groups[[1]]$point.in$x), ((max(C$groups[[1]]$point.in$x)-min(C$groups[[1]]$point.in$x))/250) ) ) )
tmpPt9    <- data.frame(predict(C$groups[[1]]$curveInd[[3]], seq( min(C$groups[[1]]$point.in$x), max(C$groups[[1]]$point.in$x), ((max(C$groups[[1]]$point.in$x)-min(C$groups[[1]]$point.in$x))/250) ) ) )
tmpPt10   <- data.frame(predict(C$groups[[1]]$curveInd[[4]], seq( min(C$groups[[1]]$point.in$x), max(C$groups[[1]]$point.in$x), ((max(C$groups[[1]]$point.in$x)-min(C$groups[[1]]$point.in$x))/250) ) ) )
tmpPt11   <- data.frame(predict(C$groups[[1]]$curveInd[[5]], seq( min(C$groups[[1]]$point.in$x), max(C$groups[[1]]$point.in$x), ((max(C$groups[[1]]$point.in$x)-min(C$groups[[1]]$point.in$x))/250) ) ) )
tmpPt12   <- data.frame(predict(C$groups[[1]]$curveInd[[6]], seq( min(C$groups[[1]]$point.in$x), max(C$groups[[1]]$point.in$x), ((max(C$groups[[1]]$point.in$x)-min(C$groups[[1]]$point.in$x))/250) ) ) )
# group mean curve
tmpMeanC  <- data.frame(predict(C$groups[[1]]$groupMeanCurve, seq( min(C$groups[[1]]$groupMeanCurve$x), max(C$groups[[1]]$groupMeanCurve$x), ((max(C$groups[[1]]$groupMeanCurve$x)-min(C$groups[[1]]$groupMeanCurve$x))/250) ) ) )

# plot 
p6        <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + theme(axis.title.y = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank(), plot.margin=unit(c(0.5,0.25,0.5,-0.25), "cm"))  # init
p6        <- p6 + geom_point(data=pt_C, aes(x=x, y=y), size=2.5 )                             # points
p6        <- p6 + geom_line( data=tmpPt7,  aes(x=x, y=y), linetype=2, color='blue' )          # ind
p6        <- p6 + geom_line( data=tmpPt8,  aes(x=x, y=y), linetype=2, color='blue' )          # ind
p6        <- p6 + geom_line( data=tmpPt9,  aes(x=x, y=y), linetype=2, color='blue' )          # ind
p6        <- p6 + geom_line( data=tmpPt10, aes(x=x, y=y), linetype=2, color='blue' )          # ind
p6        <- p6 + geom_line( data=tmpPt11, aes(x=x, y=y), linetype=2, color='blue' )          # ind
p6        <- p6 + geom_line( data=tmpPt12, aes(x=x, y=y), linetype=2, color='blue' )          # ind
p6        <- p6 + geom_line( data=tmpMeanC, aes(x=x, y=y), linetype=1, size=1, col='blue' )   # group mean curve
p6        <- p6 + xlab(expression(atop('Group mean curve generated', paste('from individual trajectories'))))


grid.arrange(p4,p5,p6, ncol=3)


