## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)
require(prepplot)
require(ggplot2)
require(grid)
require(gridBase)

## ----ggplot, echo=FALSE, fig.height=3.5, fig.width=9, fig.cap="`prepplot` and `ggplot`"----
par(mfrow=c(1, 3), mgp=c(2,0.2,0), mar=c(3.1,4.1,4.1,1.6))
## prepplot grid default 
prepplot(swiss$Education, swiss$Fertility,
         ## manage grid
         gridx=TRUE, gridy=TRUE, 
         ## annotation
         xlab="Education", ylab="Fertility", 
         main="prepplot default grid")
points(Fertility ~ Education, swiss, pch=16, col="grey20", cex=1.3)
## prepplot ggplot like 
prepplot(swiss$Education, swiss$Fertility, 
         ## manage grid
         gridx=TRUE, gridy=TRUE, col.grid="white", lty.grid="solid", 
         ## manage axis annotation
         cex=0.75, cex.lab=1.35, col.axis="black",
         xlab="Education", ylab="Fertility", 
         ## manage title
         main="prepplot ggplot like", 
         cex.main=1.75, font.main=1, col.main="black")
points(Fertility ~ Education, swiss, pch=16, cex=1.3)
## add the default ggplot plot
## following the answer in StackOverflow question
# https://stackoverflow.com/questions/14124373/
# combine-base-and-ggplot-graphics-in-r-figure-window
plot.new()
vps <- baseViewports()
pushViewport(vps$figure) ## in the third plot region
vp1 <-plotViewport(c(0,0.5,1,0.25)) ## create new vp with margins 
p <- ggplot(swiss, aes(Education, Fertility)) +
  geom_point() + labs(title="ggplot default")
print(p, vp = vp1)

## ----default, fig.height=3, fig.cap="`prepplot` default plot regions"----
x <- 0:10
y <- -5:5
par(mfrow=c(1,2), mar=c(2.1, 4.1, 4.1, 2.1))
prepplot(x, y, main='default axis extension')
points(x,y, pch=16)
prepplot(x, y, xaxs="i", yaxs="i", main='limits match axis extent')
points(x,y, pch=16, xpd=TRUE)

## ----majorminor, fig.cap="Major and minor grid lines on white background"----
par(mar=par("mar")-1, mgp=c(2,0.3,0))
prepplot(c(0,10), c(25,30), yticks=25:30, bg="white",
         lwd.grid.minor=1, gridyminor=4, gridx=TRUE,
         xlab="x axis label", ylab="y axis label", 
         main="Major/minor grid on white background")

## ----reuse, ref.label="ggplot", echo=TRUE, eval=FALSE--------------------
#  par(mfrow=c(1, 3), mgp=c(2,0.2,0), mar=c(3.1,4.1,4.1,1.6))
#  ## prepplot grid default
#  prepplot(swiss$Education, swiss$Fertility,
#           ## manage grid
#           gridx=TRUE, gridy=TRUE,
#           ## annotation
#           xlab="Education", ylab="Fertility",
#           main="prepplot default grid")
#  points(Fertility ~ Education, swiss, pch=16, col="grey20", cex=1.3)
#  ## prepplot ggplot like
#  prepplot(swiss$Education, swiss$Fertility,
#           ## manage grid
#           gridx=TRUE, gridy=TRUE, col.grid="white", lty.grid="solid",
#           ## manage axis annotation
#           cex=0.75, cex.lab=1.35, col.axis="black",
#           xlab="Education", ylab="Fertility",
#           ## manage title
#           main="prepplot ggplot like",
#           cex.main=1.75, font.main=1, col.main="black")
#  points(Fertility ~ Education, swiss, pch=16, cex=1.3)
#  ## add the default ggplot plot
#  ## following the answer in StackOverflow question
#  # https://stackoverflow.com/questions/14124373/
#  # combine-base-and-ggplot-graphics-in-r-figure-window
#  plot.new()
#  vps <- baseViewports()
#  pushViewport(vps$figure) ## in the third plot region
#  vp1 <-plotViewport(c(0,0.5,1,0.25)) ## create new vp with margins
#  p <- ggplot(swiss, aes(Education, Fertility)) +
#    geom_point() + labs(title="ggplot default")
#  print(p, vp = vp1)

## ----parandmore, fig.cap='Some examples with `xaxs="i" and yaxs="i"`'----
par(mfrow=c(2,2), mar=c(3.1, 4.1, 3.1, 2.1), mgp=c(2,0.5,0), xaxs="i", yaxs="i")
prepplot(xlim=c(0,9), ylim=c(0,12), col.grid="grey98", 
         lty.grid=1, lwd.grid=1.5, gridx=0:9, gridy=seq(0,12,2), 
         xlab="x", ylab="y", cex = 0.7, mgpx=c(1.5,0.25,0), 
         mgpy=c(1.75,0.5,0), main="ggplot style")

prepplot(xlim=c(0,9), ylim=c(0,12),  
gridx=0:9, gridy=seq(0,12,2), 
         xlab="x", ylab="y", cex = 0.7,  
         main="default grid lines")

prepplot(xlim=c(0,9), ylim=c(0,12), gridx=0:9, gridy=seq(0,12,2), 
         xlab="x", ylab="y", cex = 0.7, lty.grid="solid", 
         mgpx=c(2,0.5,0), main="default solid grid lines")

prepplot(ylim=c(0,12), xlim=c(0,9), stripesx=0:9, 
         xlab="x", yaxt="n", cex = 0.7, mgpx=c(2,0.5,0), 
         main="default vertical stripes, no y axis")

## ----barplots, fig.cap="Barplots on striped background, with slightly transparent bars", fig.width=7----
tab <- c(one=10, two=5, three=8, four=7, five=12, six=10, seven=9)
par(mfrow=c(1,2), mar=c(3.1, 4.1, 3.1, 2.1))
prepplot(ylim=c(0,8.5), xlim=c(-0.2,13), 
         yaxs="i", stripesx=seq(0,12,2), 
         xlab="Frequency", yaxt="n", cex = 0.8, mgpx=c(2,0.5,0), 
         main="Default colors", cex.main=1.2)
barplot(tab, col=rgb(0.5, 0.5, 0.5, 0.7),
        border=FALSE, add=TRUE, xaxt="n",las=2, horiz=TRUE, 
        cex.names=0.8)
hks51 <- rgb(0, 152/256, 161/256)
prepplot(ylim=c(0,8.5), xlim=c(-0.2,13), 
         yaxs="i",
         xticks=seq(0,12,2), stripesx=TRUE, 
         xlab="Frequency", 
         bg=rgb(235/256, 246/256, 246/256), 
         col.stripes = rgb(190/256, 226/256, 226/256, 0.4), 
         col.axis=hks51, cex=0.8, col.main=hks51, 
         yaxt="n", tcl=-0.2, mgpx=c(2,0.5,0), 
         main="Beuth colors", 
         cex.main=1.2, col.main=hks51)
barplot(tab, 
        col=rgb(0,152/256,161/256,0.7), border=FALSE, add=TRUE, 
        xaxt="n",las=2, horiz=TRUE, cex.names=0.8, col.axis=rgb(0,152/256,161/256))

## ----orient, fig.cap="Scatter plots with different orientation mark strategies", fig.height=6, fig.width=8----
par(mfrow=c(2,3), oma=c(2,0,0,0), mgp=c(2.25,0.5,0), 
    mar=c(3.1, 4.1, 3.1, 2.1))
## default axis system with grid lines
prepplot(xlim=swiss$Education, ylim=swiss$Fertility, mgpy=c(2.5,0.5,0),
         xlab="Education", ylab="Fertility", 
         gridx=TRUE, gridy=TRUE, cex=0.8, 
         main="grid lines")
points(swiss$Education, swiss$Fertility, pch=16, col="grey20")

## stripes and grid lines
prepplot(xlim=swiss$Education, ylim=swiss$Fertility, 
         mgpy=c(2.5,0.5,0),
         xlab="Education", ylab="Fertility", 
         stripesx=seq(-5,60,5), gridy=seq(30,100,10), cex=0.8, 
         xticks=seq(0,50,10), yticks = seq(40,90,10), 
         main="stripes and grid lines")
points(swiss$Education, swiss$Fertility, pch=16, col="grey20")

prepplot(xlim=range(swiss$Education), ylim=range(swiss$Fertility), 
         mgpy=c(2.5,0.5,0),
         xlab="Education", ylab="Fertility", 
         gridx=seq(0,60,10), stripesy=seq(30,100,5), cex=0.8, 
         xticks=seq(0,50,10), yticks = seq(40,90,10), 
         main="stripes and grid lines")
points(swiss$Education, swiss$Fertility, pch=16, col="grey20")

## stripes only
prepplot(xlim=range(swiss$Education), ylim=range(swiss$Fertility), 
         mgpy=c(2.5,0.5,0),
         xlab="Education", ylab="Fertility", 
         stripesx=seq(-5,60,5), stripesy=seq(30,100,5), cex=0.8, 
         xticks=seq(0,50,10), yticks = seq(40,90,10), 
         main="crossing stripes")
points(swiss$Education, swiss$Fertility, pch=16, col="grey20")

prepplot(xlim=range(swiss$Education), ylim=range(swiss$Fertility),
         mgpy=c(2.5,0.5,0),
         xlab="Education", ylab="Fertility", 
         stripesx=seq(-5,60,5), cex=0.8, 
         xticks=seq(0,50,10), yticks = seq(40,90,10),
         main="only vertical stripes")
points(swiss$Education, swiss$Fertility, pch=16, col="grey20")

prepplot(xlim=range(swiss$Education), ylim=range(swiss$Fertility), 
         mgpy=c(2.5,0.5,0),
         xlab="Education", ylab="Fertility", 
         stripesy=seq(30,100,5), cex=0.8, 
         yticks = seq(40,90,10), xticks=seq(0,50,10),
         main="only horizontal stripes")
points(swiss$Education, swiss$Fertility, pch=16, col="grey20")

mtext(side=1, line=0.5, 
  'Some strategies are better than others ...', 
  cex=0.8, outer=TRUE, col="grey20")


## ----stripes, fig.cap="Plot region with horizontal stripes and a horizontal arrow axis at y=0"----
prepplot(0:10, -5:5, yticks=seq(-5,5,5), 
         stripesy=-5:5, 
         xlab="x", ylab="y", main="with stripes and arrow axis", cex=0.8, cex.main=1.2,
         axis.arrow = c(0,NA),arrow.length = 0.5,arrow.width = 0.5, 
         lwd=2)

## ----datetime, fig.height=2, fig.cap="A time series. Stripes show down times, vertical lines show day boundaries"----
par(mar=c(1.5, 3, 3, 1), mgp=c(3,0.2,0))
xlim <- as.numeric(as.POSIXlt(c("2017-12-28 18:09:46","2018-01-02 09:15:22")))

stripelims <- as.numeric(as.POSIXlt(
  c("2017-12-29 10:30:00","2017-12-29 12:00:00",
    "2017-12-30 10:00:00","2017-12-30 12:30:00",
    "2017-12-31 10:00:00","2017-12-31 12:30:00",
    "2018-01-01 10:30:00","2018-01-01 11:30:00",
    "2018-01-01 16:30:00","2018-01-01 17:45:00")))
griddatts <- as.POSIXlt(c(
    "2017-12-29 00:00:00", "2017-12-30 00:00:00",
    "2017-12-31 00:00:00", "2018-01-01 00:00:00",
    "2018-01-02 00:00:00"))
gridposs <- as.numeric(griddatts)
tickposs <- gridposs + 12*3600
tickposs <- tickposs[tickposs < xlim[2]]
prepplot(xlim=xlim, ylim=c(-5,10),
         stripesx=stripelims, xaxt="n", cex=0.7,
         gridy=TRUE, gridyminor=4, 
         main="Date-time data with stripes and grid lines on same axis")
abline(v=gridposs, col="grey20")
axis(side=1, at=tickposs, 
     labels=as.Date(as.POSIXlt(tickposs, origin="1970-01-01 00:00.00 UTC")), 
     lwd=0, cex.axis=0.7)

