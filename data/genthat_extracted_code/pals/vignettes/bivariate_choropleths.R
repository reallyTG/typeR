## ----setup, message=FALSE---------------------------------------------------------------
library("knitr")
knitr::opts_chunk$set(fig.align="center", fig.width=6, fig.height=6)
options(width=90)

## ---------------------------------------------------------------------------------------
require(latticeExtra) # USCancerRates, mapplot
require(maps) # map
require(classInt) # classIntervals, findCols
require(grid) # viewport, pushViewport
require(pals) # brewer.blues, stevens.pinkgreen

suppressWarnings(print(
  mapplot(rownames(USCancerRates) ~ log(rate.male) + log(rate.female),
          data = USCancerRates,
          colramp = brewer.blues,
          map = map("county", plot = FALSE, fill = TRUE,
                    projection = "tetra"),
          breaks=classIntervals(log(USCancerRates$rate.female), n=3, style='quantile')$brks,
          scales = list(draw = FALSE))
))


## ---------------------------------------------------------------------------------------

cols <- stevens.pinkgreen; nbins <- 3

# categorize rates into 3 percentile bins
brksm <- classIntervals(log(USCancerRates$rate.male), n=nbins, style='quantile')
brksf <- classIntervals(log(USCancerRates$rate.female), n=nbins, style='quantile')
classm <- findCols(brksm)
classf <- findCols(brksf)
# convert x,y classes into a joint class x+3(y-1)
USCancerRates$class2 <- classm + nbins*(classf-1)

# scatterplot of two variates showing bins
plot(log(rate.female) ~ log(rate.male), data=USCancerRates,
     col=cols()[USCancerRates$class2], pch=19,
     xlim=c(4.5, 6.5), ylim=c(4.0, 6))

## ---- fig.width=8-----------------------------------------------------------------------
m3 <- mapplot(rownames(USCancerRates) ~ class2, data = USCancerRates,
              colramp=cols, breaks=seq(from=0.5, by=1, length=nbins*nbins+1),
              xlab="",
              colorkey=FALSE,
              map = map("county", plot = FALSE, fill = TRUE,
                        projection = "tetra"),
              scales = list(draw = FALSE))
suppressWarnings(print( m3 ))
# add the color legend
m3leg <- levelplot(matrix(1:(nbins*nbins), nrow=nbins), axes=FALSE, col.regions=cols(),
                   xlab="male  -->", ylab="female  -->", cuts=8, colorkey=FALSE,
                   scales=list(draw=0))
vp <- viewport(x=.15, y=.25, width=.2, height=.2)
pushViewport(vp)
print(m3leg, newpage=FALSE)
popViewport()

# test
print(m3, more=TRUE)
print(m3leg, position=c(.05, .15, .25, .35), more=FALSE)


