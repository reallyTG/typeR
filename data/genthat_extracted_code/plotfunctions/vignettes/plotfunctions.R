## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(eval=TRUE, include=TRUE, echo=TRUE, fig.height = 4, fig.width = 4)

## ----startup-------------------------------------------------------------
library(plotfunctions)

## ----ex1, fig.width=8, fig.height=4, fig.show="hold"---------------------
par(mfrow=c(1,2))
set.seed(123)

# PLOT1: t-distribution:
test <- rt(1000, df=5)
check_normaldist(test)

# PLOT2: skewed data, e.g., reaction times:
test <- exp(rnorm(1000, mean=.500, sd=.25))
check_normaldist(test)

## ----ex1b, fig.width=8, fig.height=4, fig.show="hold"--------------------
par(mfrow=c(1,2))
set.seed(123)

# PLOT1: t-distribution:
test <- rt(1000, df=5)
qqnorm(test)
qqline(test)

# PLOT2: skewed data, e.g., reaction times:
test <- exp(rnorm(1000, mean=.500, sd=.25))
qqnorm(test)
qqline(test)

## ----ex2-----------------------------------------------------------------

# example InsectSprays from R datasets
avg <- aggregate(count ~ spray, data=InsectSprays, mean)
avg <- merge(avg, 
    aggregate(count ~ spray, data=InsectSprays, sd),
    by="spray", all=TRUE)
# we could add the type of spray to the averages:
avg$type <- c(1,1,2,2,2,1)

# visualize output
dotplot_error(avg$count.x, se.val=avg$count.y, groups=avg$type, labels=avg$spray) 

## ----ex3, fig.width=12, fig.height=4, fig.show="hold"--------------------
# 3 panels:
par(mfrow=c(1,3), cex=1.1)

# define x and y
x <- -5:20
y <- x^2

# PLOT 1:
plot(x, y, pch=16)
# convert arrow positions:
ap1 <- getArrowPos(x, y, units="coords")

# PLOT 2:
plot(x, -1*y)
# convert arrow positions:
ap2 <- getArrowPos(x, -1*y, units="coords")
ap3 <- getArrowPos(c(1,1,1), c(1,.5,0), units="prop")

# PLOT 3:
plot(x, -2*y+200, ylim=c(-600,200), pch=18)
abline(h=c(0,-400), lty=3, col='red2')
points(x, -1*y)
ap4 <- getArrowPos(c(0,0,0), c(.75,.5,.25), units="prop")

# DRAW ARROWS:
drawDevArrows(start=ap1, end=ap2, arrows="none", 
              col=alphaPalette("red2", f.seq=c(.1,1), n=length(x)))

drawDevArrows(start=ap3, end=ap4, arrows="end", col="red2", lwd=3, length=.1)

## ----ex4, fig.width=12, fig.height=4, fig.show="hold"--------------------
par(mfrow=c(1,3), cex=1.1)

# PLOT 1:
emptyPlot(10,1)

# PLOT 2:
emptyPlot(c(-10, 10), c(-100,500), 
          h0=0, main="Plot 2", xlab="X", ylab="Y")

# PLOT 3:
emptyPlot(c(-100, 1000), c(-8,8), 
          h0=0, v0=0, eegAxis=TRUE,
          main="Plot 3: EEG axes")


## ----ex5-----------------------------------------------------------------
# load example data:
data(chickwts)

# first calculate means and sd per feeding type:
avg <- with(chickwts, tapply(weight, list(feed), mean))
sds <- with(chickwts, tapply(weight, list(feed), sd))

# barplot:
b <- barplot(avg, beside = TRUE, ylim=c(0,400),
             col="steelblue", las=2)
# add errorbars:
errorBars(b, avg, sds)
# add average:
add_bars(b[length(b)]+diff(b[1:2]), mean(avg), 
         col="red", xpd=TRUE)
errorBars(b[length(b)]+diff(b[1:2]), mean(avg), se(avg), xpd=TRUE)
mtext("mean/SE", at=b[length(b)]+diff(b[1:2]), line=1, side=1, font=2, las=2)


## ----ex6, fig.show="hold"------------------------------------------------
emptyPlot(c(-10,100), c(-2,2), h0=0, v0=0)

# Proportions to coordinates:
x <- getCoords(c(0, .25, .5, .75, 1))
y <- getCoords(c(0, .25, .5, .75, 1), side=2)
points(x, y, col="red1", pch=1:5, lwd=2, xpd=TRUE)

# wrt figure region:
x <- getCoords(c(0.05, .25, .5, .75, .95), input="f")
y <- getCoords(c(0.05, .25, .5, .75, .95), side=2, input="f")
points(x, y, col="steelblue", pch=1:5, lwd=2, xpd=TRUE)

## ----ex7, fig.show='hide'------------------------------------------------
emptyPlot(c(-10,100), c(-2,2), h0=0, v0=0)

# get plot coordinates:
getFigCoords("p")
# get figure coordinates:
getFigCoords("f")

# get proportions:
getProps(c(20,60,100,500))
getProps(c(-2,1,4), side=2)

## ----ex8, fig.show='hold'------------------------------------------------
dat <- expand.grid(x=seq(0,1,by=.1), y=seq(0,1, by=.1))
dat$z <- dat$x * dat$y

emptyPlot(1, 1, xlab="X", ylab="Y")
points(dat$x, dat$y, col=topo.colors(100)[round(dat$z*99)+1], pch=16, cex=2)
gradientLegend(range(dat$z), color="topo", nCol=100,inside = FALSE, pos=.825)

## ----ex9, fig.show='hold'------------------------------------------------
emptyPlot(1, 1, xlab="X", ylab="Y", bty='o')
legend("topright", legend=c("normal", "topright"), pch=21)
legend("center", legend=c("normal", "center"), pch=21)
legend("bottomleft", legend=c("normal", "bottomleft"), pch=21)

legend_margin("topright", legend=c("margin", "topright"), pch=21,
              col="red1", box.col="red1", text.col="red1")
legend_margin("center", legend=c("margin", "center"), pch=21,
              col="red1", box.col="red1", text.col="red1")
legend_margin("bottomleft", legend=c("margin", "bottomleft"), pch=21,
              col="red1", box.col="red1", text.col="red1")

## ----ex10, fig.show="hold", fig.width=8, fig.height=4--------------------
set.seed(1234)

# grand mean of data:
x <- 1:100
y <- -0.01*(x - 30)^2+rnorm(100, mean=100)
# stimulus onset values:
so <- runif(100, min=20, max=40)+rnorm(100, sd=2)


par(mfrow=c(1,2), cex=1.1)

# PLOT 1
emptyPlot(range(x), range(y), h0=0, 
          main="Data", xlab="Time", ylab="Y")
lines(x, y, lwd=2, col='steelblue')
# add mean of stimulus onset:
abline(v=mean(so), lwd=2)
# add density of stimulus onset in 
marginDensityPlot(density(so), side=1)


# PLOT 2
emptyPlot(range(x), range(y), h0=0, 
          main="More examples", xlab="Time", ylab="Y")
lines(x, y, lwd=2, col='steelblue')
# add mean of stimulus onset:
abline(v=mean(so), lwd=2)
# add density of stimulus onset on top of plot:
marginDensityPlot(density(so), side=3, scale=1, density=25)
marginDensityPlot(density(so), side=3, from=getCoords(0, side=2), scale=1)
# or on left side:
marginDensityPlot(density(y), side=2, col="steelblue")

## ----ex11, fig.width=12, fig.height=4, fig.show="hold"-------------------
data(volcano)
x <- 10*(1:nrow(volcano))
y <- 10*(1:ncol(volcano))

par(mfrow=c(1,3), cex=1.1)

# PLOT 1: image and contour
image(x, y, volcano, col = terrain.colors(100), 
      axes = FALSE, xlab="", ylab="")
contour(x, y, volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = "peru")

# PLOT 2: color_contour
color_contour(x, y, volcano, 
              color = terrain.colors(100), axes=FALSE,
              col="peru", levels=seq(90, 200, by = 5))


# PLOT 3: filled.contour (takes the complete device)
filled.contour(x, y, volcano, color.palette = terrain.colors, axes=FALSE)
# not possible to add contour lines:
contour(x, y, volcano, levels = seq(90, 200, by = 5),
        add = TRUE, col = "peru")

## ----ex12, fig.show="hold", fig.width=8, fig.height=4--------------------
dat <- expand.grid(x=seq(0,1,by=.1), y=seq(0,1, by=.1))
dat$z <- dat$x * dat$y
# inspect the structure of the data:
head(dat)

par(mfrow=c(1,2), cex=1.1)
# PLOT 1: plot the default surface
plotsurface(dat, view=c("x", "y"), predictor="z")

# PLOT 2: customized color palette
plotsurface(dat, view=c("x", "y"), predictor="z", 
            color = c('gray25', 'white',  'red'), col=1,
            main="Customized interaction surface", labcex=1)

## ----ex13, fig.show=FALSE, fig.width=8, fig.height=4---------------------
# Generate some data:
x <- -10:20
y <- 0.3*(x - 3)^2 + rnorm(length(x))
s <- 0.15*abs(100-y + rnorm(length(x)))

par(mfrow=c(1,2), cex=1.1)

# PLOT 1: shaded confidence interval
emptyPlot(range(x), c(-25,100), h0=0, v0=0, main="Symmetric CI")
plot_error(x, y, s, shade=TRUE, lwd=2, col="steelblue")

# PLOT 2: Use of se.fit2 for asymmetrical error bar
cu <- y + 2*s
cl <- y - s
emptyPlot(range(x), c(-25,100), h0=0, v0=0, main="Asymmetric CI")
plot_error(x, y, s, shade=TRUE, lwd=2, col="steelblue")
plot_error(x, y, se.fit=cu, se.fit2=cl, col='red', shade=TRUE, density=30)

## ----ex14, eval=FALSE----------------------------------------------------
#  # 1 A. load png image directly -- only works with package png:
#  img <- system.file("extdata", "Netherlands_by_SilverSpoon.png", package = "plotfunctions")
#  plot_image(img=img, type='png')

## ----ex14b---------------------------------------------------------------
# 1 B. load image object:
data(img)
plot_image(img=img, type='image')

## ----ex15, fig.width=8, fig.height=4, fig.show="hold"--------------------
par(mfrow=c(1,2), cex=1.1)

# PLOT 1: replace colors
plot_image(img=img, type='image', replace.colors = list("#00000000"="#0000FF33", "#B.+"="#99DD99FF"),
           main="the Netherlands")
points(c(.45, .8), c(.6, .85), pch=15)
text(c(.45, .8), c(.6, .85), labels=c("Amsterdam", "Groningen"), pos=1)

# example data
x <- 1:100
y <- -0.01*(x - 30)^2+rnorm(100, mean=100)

# PLOT 2: add picture to existing plot, while keeping original picture size ratio
p <- getRatioCoords(ratio=dim(img$image)[1]/dim(img$image)[2], 
                    width=20, ytop=90, xright=60)
emptyPlot(100, c(50, 100), h0=0, 
          main="Example data plot")
lines(x, y, lwd=2, col='steelblue')
plot_image(img=img, type='image', add=TRUE, 
           xrange=p$x, yrange=p$y,
           replace.colors = list("#B.+"="steelblue"),
           bty='n')

