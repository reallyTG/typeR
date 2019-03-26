## ---- out.width = "700px", echo = FALSE----------------------------------
knitr::include_graphics("../man/figures/santaR-eigenspline.png")

## ---- fig.width=7, fig.height=7------------------------------------------
## ----------------------------------------------------
## 2 levels of resolution
## ----------------------------------------------------

# make curve (cos) with added circadian variation (sin)
x1  = seq(-0.5, 5.5, 0.01)
x11 = (x1*(2/5)*pi)+pi
y1  = 2.5*cos(x11+((pi)/10)) + sin(x1*2*pi) +3.5

# one measurement per day
x2  = seq(0, 5, 1)
x22 = (x2*(2/5)*pi)+pi
y2  = 2.5*cos(x22+((pi)/10)) + sin(x2*2*pi) +3.5

# one measurement every 4 hours
x3  = seq(0, 5, 1/6)
x33 = (x3*(2/5)*pi)+pi
y3  = 2.5*cos(x33+((pi)/10)) + sin(x3*2*pi) +3.5


## generate a spline at each resolution------------------------------
time      = seq(0, 5, 0.01)
tmp_fit0  = smooth.spline( x1, y1, df=601) # original
tmp_fit1  = smooth.spline( x2, y2, df=6)   # daily sampling
tmp_fit2  = smooth.spline( x3, y3, df=31)  # 4h sampling


# plot each time trajectory------------------------------------------
library(ggplot2)
library(gridExtra)
library(grid)

tmpDaily  = data.frame( x=x2,  y=y2)
tmp4h     = data.frame( x=x3,  y=y3)

pred0    = predict( object=tmp_fit0, x=time )
pred1    = predict( object=tmp_fit1, x=time )
pred2    = predict( object=tmp_fit2, x=time )

tmpPred0 = data.frame( x=pred0$x, y=pred0$y)
tmpPred1 = data.frame( x=pred1$x, y=pred1$y)
tmpPred2 = data.frame( x=pred2$x, y=pred2$y)

p0      <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + xlim(0,5) + ylim(0,7.1) + theme(axis.title.x = element_blank(), axis.ticks = element_blank(), axis.text.x = element_blank(), axis.text.y = element_blank())
p0      <- p0 + geom_line( data=tmpPred0, aes(x=x, y=y), linetype=1, color='black' )
p0      <- p0 + geom_point(data=tmp4h,    aes(x=x, y=y), size=2.5,   color='grey60' )
p0      <- p0 + geom_point(data=tmpDaily, aes(x=x, y=y), size=2.5,   color='grey25' )
p0      <- p0 + ylab('Variable response')

p2      <- ggplot(NULL, aes(x), environment = environment()) + theme_bw() + xlim(0,5) + ylim(0,7.1) + theme(axis.ticks = element_blank(), axis.text.y = element_blank())
p2      <- p2 + geom_point(data=tmp4h, aes(x=x, y=y), size=2.5, color='springgreen3' )
p2      <- p2 + geom_line( data=tmpPred2, aes(x=x, y=y), linetype=1, color='springgreen3' )
p2      <- p2 + geom_point(data=tmpDaily, aes(x=x, y=y), size=2.5, color='mediumblue' )
p2      <- p2 + geom_line( data=tmpPred1, aes(x=x, y=y), linetype=1, color='mediumblue' )
p2      <- p2 + xlab('Time') + ylab('Variable response')

grid.arrange(p0,p2, ncol=1)

## ---- out.width = "500px", echo = FALSE----------------------------------
knitr::include_graphics("../man/figures/santaR-complexity_and_sampling.png")

