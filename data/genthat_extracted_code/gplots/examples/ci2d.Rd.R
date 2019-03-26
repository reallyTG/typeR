library(gplots)


### Name: ci2d
### Title: Create 2-dimensional empirical confidence regions
### Aliases: ci2d print.ci2d
### Keywords: dplot hplot nonparametric

### ** Examples

   ####
   ## Basic usage 
   ####
   data(geyser, package="MASS")

   x <- geyser$duration
   y <- geyser$waiting

   # 2-d confidence intervals based on binned kernel density estimate
   ci2d(x,y)                   # filled contour plot
   ci2d(x,y, show.points=TRUE) # show original data


   # image plot
   ci2d(x,y, show="image")
   ci2d(x,y, show="image", show.points=TRUE)

   # contour plot
   ci2d(x,y, show="contour", col="black")
   ci2d(x,y, show="contour", col="black", show.points=TRUE)

   ####
   ## Control Axis scales
   ####
   x <- rnorm(2000, sd=4)
   y <- rnorm(2000, sd=1)

   # 2-d confidence intervals based on binned kernel density estimate
   ci2d(x,y)

   # 2-d confidence intervals based on 2d histogram
   ci2d(x,y, method="hist2d", nbins=25)
 
   # Require same scale for each axis, this looks oval
   ci2d(x,y, range.x=list(c(-20,20), c(-20,20)))
   ci2d(x,y, method="hist2d", same.scale=TRUE, nbins=25) # hist2d 

   ####
   ## Control smoothing and binning 
   ####
   x <- rnorm(2000, sd=4)
   y <- rnorm(2000, mean=x, sd=2)

   # Default 2-d confidence intervals based on binned kernel density estimate
   ci2d(x,y)

   # change the smoother bandwidth
   ci2d(x,y,
        bandwidth=c(sd(x)/8, sd(y)/8)
       )

   # change the smoother number of bins
   ci2d(x,y, nbins=10)
   ci2d(x,y)
   ci2d(x,y, nbins=100)

   # Default 2-d confidence intervals based on 2d histogram
   ci2d(x,y, method="hist2d", show.points=TRUE)

   # change the number of histogram bins
   ci2d(x,y, nbin=10, method="hist2d", show.points=TRUE )
   ci2d(x,y, nbin=25, method="hist2d", show.points=TRUE )

   ####
   ## Perform plotting manually
   ####
   data(geyser, package="MASS")

   # let ci2d handle plotting contours...
   ci2d(geyser$duration, geyser$waiting, show="contour", col="black")

   # call contour() directly, show the 90 percent CI, and the mean point 
   est <- ci2d(geyser$duration, geyser$waiting, show="none")
   contour(est$x, est$y, est$cumDensity,
           xlab="duration", ylab="waiting",
           levels=0.90, lwd=4, lty=2)
   points(mean(geyser$duration), mean(geyser$waiting),
         col="red", pch="X")


   ####
   ## Extract confidence region values
   ###
   data(geyser, package="MASS")

   ## Empirical 90 percent confidence limits
   quantile( geyser$duration, c(0.05, 0.95) )
   quantile( geyser$waiting, c(0.05, 0.95) )

   ## Bivariate 90 percent confidence region
   est <- ci2d(geyser$duration, geyser$waiting, show="none")
   names(est$contours) ## show available contours

   ci.90 <- est$contours[names(est$contours)=="0.9"]  # get region(s)
   ci.90 <- rbind(ci.90[[1]],NA, ci.90[[2]], NA, ci.90[[3]]) # join them

   print(ci.90)                  # show full contour
   range(ci.90$x, na.rm=TRUE)    # range for duration
   range(ci.90$y, na.rm=TRUE)    # range for waiting

   ####
   ## Visually compare confidence regions 
   ####
   data(geyser, package="MASS")

   ## Bivariate smoothed 90 percent confidence region
   est <- ci2d(geyser$duration, geyser$waiting, show="none")
   names(est$contours) ## show available contours

   ci.90 <- est$contours[names(est$contours)=="0.9"]  # get region(s)
   ci.90 <- rbind(ci.90[[1]],NA, ci.90[[2]], NA, ci.90[[3]]) # join them

   plot( waiting ~ duration, data=geyser,
         main="Comparison of 90 percent confidence regions" )
   polygon( ci.90, col="green", border="green", density=10)

   ## Univariate Normal-Theory 90 percent confidence region
   mean.x <- mean(geyser$duration)
   mean.y <- mean(geyser$waiting)
   sd.x <- sd(geyser$duration)
   sd.y <- sd(geyser$waiting)

   t.value <- qt(c(0.05,0.95), df=gdata::nobs(geyser$duration), lower=TRUE)
   ci.x <- mean.x +  t.value* sd.x
   ci.y <- mean.y +  t.value* sd.y

   plotCI(mean.x, mean.y,
          li=ci.x[1],
          ui=ci.x[2],
          barcol="blue", col="blue",
          err="x",
          pch="X",
          add=TRUE )

   plotCI(mean.x, mean.y,
          li=ci.y[1],
          ui=ci.y[2],
          barcol="blue", col="blue",
          err="y",
          pch=NA,
          add=TRUE )

#   rect(ci.x[1], ci.y[1], ci.x[2], ci.y[2], border="blue",
#        density=5,
#        angle=45,
#        col="blue" )


   ## Empirical univariate 90 percent confidence region
   box <- cbind( x=quantile( geyser$duration, c(0.05, 0.95 )), 
                 y=quantile( geyser$waiting, c(0.05, 0.95 )) )

   rect(box[1,1], box[1,2], box[2,1], box[2,2], border="red",
        density=5,
        angle=-45,
        col="red" )

   ## now a nice legend
   legend( "topright", legend=c("       Region type",
                                "Univariate Normal Theory",
                                "Univarite Empirical",
                                "Smoothed Bivariate"),
           lwd=c(NA,1,1,1),
           col=c("black","blue","red","green"),
           lty=c(NA,1,1,1)
         )

   ####
   ## Test with a large number of points
   ####
   ## Not run: 
##D    x <- rnorm(60000, sd=1)
##D    y <- c( rnorm(40000, mean=x, sd=1),
##D            rnorm(20000, mean=x+4, sd=1) )
##D 
##D    hist2d(x,y)
##D    ci <- ci2d(x,y)
##D    ci
##D    
## End(Not run)



