library(rasterVis)


### Name: levelplot-methods
### Title: Level and contour plots of Raster objects.
### Aliases: levelplot contourplot levelplot,Raster,missing-method
###   contourplot,Raster,missing-method
### Keywords: methods spatial

### ** Examples

f <- system.file("external/test.grd", package="raster")
r <- raster(f)
levelplot(r)

## Change the color theme
levelplot(r, par.settings=GrTheme())
levelplot(r, par.settings=PuOrTheme())

myTheme=rasterTheme(region=brewer.pal('Blues', n=9))
levelplot(r, par.settings=myTheme)

## Define the legend breaks
my.at <- seq(100, 1850, 500)
levelplot(r, at=my.at)

myColorkey <- list(at=my.at, ## where the colors change
                   labels=list(
                     at=my.at ## where to print labels
                     ))
levelplot(r, at=my.at, colorkey=myColorkey)

myColorkey <- list(at=my.at, ## where the colors change
                   labels=list(
                     labels=letters[seq_along(my.at)], ## labels
                     at=my.at ## where to print labels
                     ))
levelplot(r, at=my.at, colorkey=myColorkey)

## Define the units of the color key
levelplot(r, colorkey = list(title = "[m]"))

levelplot(r, margin = FALSE,
             colorkey = list(title = "[m]",
                             title.gpar = list(cex = 1,
                                               font = 2,
                                               col = 'red')
                             ))

## shrink and border color
rCenter <- (maxValue(r) + minValue(r)) / 2
levelplot(r - rCenter, par.settings=RdBuTheme(), shrink=c(.8, 15), border='black')

## With subticks
levelplot(r, xscale.components=xscale.raster.subticks,
             yscale.components=yscale.raster.subticks)

levelplot(r, xscale.components=xscale.raster.subticks,
             yscale.components=yscale.raster.subticks,
             scales=list(x=list(rot=30, cex=0.8)))

## log-scale
levelplot(r^2, zscaleLog=TRUE, contour=TRUE)

## Customizing axis and title labels
levelplot(r, margin=FALSE,
          main=list('My plot', col='red'),
          xlab=c('This is the', 'X-Axis'),
          ylab=list('Y-Axis', rot=30, fontface='bold')
          )

## xlim and ylim to display a smaller region
levelplot(r, xlim=c(179000, 181000), ylim=c(329500, 334000))

## RasterStacks
s <- stack(r, r+500, r-500)
levelplot(s, contour=TRUE)
contourplot(s, labels=list(cex=0.4), cuts=12)

## Use of layout
levelplot(s, layout=c(1, 3))
levelplot(s, layout=c(1, 1))

## names.attr to change the labels of each panel
levelplot(s, names.attr=c('R', 'R + 500', 'R - 500'))

## Defining the scales for the marginal plot
levelplot(r, margin = list(axis = TRUE,
                           scales = list(x=c(100, 600),
                                         y=c(100, 1000))))
## if a component of the list is null, it is internally calculated
levelplot(r, margin=list(axis = TRUE, scales = list(x=c(100, 1000))))

## Add a layer of sampling points
## and change the theme
pts <- sampleRandom(r, size=20, sp=TRUE)

## Using +.trellis and layer from latticeExtra
levelplot(r, par.settings = BTCTheme) + layer(sp.points(pts, col = 'red'))
contourplot(r, labels = FALSE) + layer(sp.points(pts, col = 'red'))

## or with a custom panel function
levelplot(r, par.settings=BTCTheme,
          panel=function(...){
            panel.levelplot(...)
            sp.points(pts, col='red')
            })


## Categorical data
r <- raster(nrow=10, ncol=10)
r[] = 1
r[51:100] = 3
r[3:6, 1:5] = 5
r <- ratify(r)
     
rat <- levels(r)[[1]]
rat$landcover <- c('Pine', 'Oak', 'Meadow')
rat$class <- c('A1', 'B2', 'C3')
levels(r) <- rat
r

levelplot(r, col.regions=c('palegreen', 'midnightblue', 'indianred1'))

## with 'att' you can choose another variable from the RAT
levelplot(r, att=2, col.regions=c('palegreen', 'midnightblue', 'indianred1'))
levelplot(r, att='class', col.regions=c('palegreen', 'midnightblue', 'indianred1'))

r2 <- raster(r)
r2[] = 3
r2[51:100] = 1
r2[3:6, 1:5] = 5

r3 <- init(r, function(n)sample(c(1, 3, 5), n, replace=TRUE))

## Multilayer categorical Raster* are displayed only if their RATs are the same
levels(r2) <- levels(r3) <- levels(r)

s <- stack(r, r2, r3)
names(s) <- c('A', 'B', 'C')

levelplot(s)
levelplot(s, att=2)

## Not run: 
##D ##Solar irradiation data from CMSAF http://dx.doi.org/10.5676/EUM_SAF_CM/RAD_MVIRI/V001
##D old <- setwd(tempdir())
##D download.file('https://raw.github.com/oscarperpinan/spacetime-vis/master/data/SISmm2008_CMSAF.zip',
##D    'SISmm2008_CMSAF.zip', method='wget')
##D unzip('SISmm2008_CMSAF.zip')
##D 
##D listFich <- dir(pattern='\.nc')
##D stackSIS <- stack(listFich)
##D stackSIS <- stackSIS*24 ##from irradiance (W/m2) to irradiation Wh/m2
##D 
##D idx <- seq(as.Date('2008-01-15'), as.Date('2008-12-15'), 'month')
##D 
##D SISmm <- setZ(stackSIS, idx)
##D names(SISmm) <- month.abb
##D 
##D levelplot(SISmm)
##D 
##D levelplot(SISmm, layers=1, margin = list(FUN = 'median'), contour=TRUE)
##D 
##D setwd(old)
## End(Not run)


