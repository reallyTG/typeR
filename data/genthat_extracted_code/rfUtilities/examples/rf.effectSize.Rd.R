library(rfUtilities)


### Name: rf.effectSize
### Title: Random Forest effect size
### Aliases: rf.effectSize

### ** Examples

 library(randomForest)
   data(airquality)
   airquality <- na.omit(airquality)
     fit.reg <- randomForest(Ozone ~ ., data=airquality)
 
 # Parameter effect sizes	
 rf.effectSize(fit.reg, y = airquality$Solar.R, pred.data = airquality, x.var = Solar.R)
 rf.effectSize(fit.reg, y = airquality$Wind, pred.data = airquality, x.var = Wind)
 rf.effectSize(fit.reg, y = airquality$Temp, pred.data = airquality, x.var = Temp)
 rf.effectSize(fit.reg, y = airquality$Month, pred.data = airquality, x.var = Month)
 rf.effectSize(fit.reg, y = airquality$Day, pred.data = airquality, x.var = Day)
 	
## Not run: 
##D  # Bootstrap of effect size for Wind and Temp
##D  B = 999
##D  n = nrow(airquality)
##D  es.boot.wind <- vector()
##D  es.boot.temp <- vector()
##D    for(i in 1:B) {
##D      boot.samples <- airquality[sample(1:nrow(airquality), n, replace = TRUE),]
##D        fmla <- stats::as.formula(paste(paste("Ozone", "~", sep=""), paste(".", collapse= "")))   
##D          fit <- randomForest(fmla, data = boot.samples)
##D      es.boot.wind <- append(es.boot.wind, rf.effectSize(fit, y = boot.samples$Wind, 
##D  	                       pred.data = boot.samples, x.var = Wind))
##D      es.boot.temp <- append(es.boot.temp, rf.effectSize(fit, y = boot.samples$Temp, 
##D  	                       pred.data = boot.samples,x.var = Temp))
##D    }        
##D   se <- function(x) sqrt(var(x, na.rm = TRUE) / length(na.omit(x)))
##D     cat("Bootstrap variance for Wind:", var(es.boot.wind), "\n")
##D       cat("Bootstrap standard error for Wind:", se(es.boot.wind), "\n","\n")
##D     cat("Bootstrap variance for Temp:", var(es.boot.temp), "\n")
##D   cat("Bootstrap standard error for Temp:", se(es.boot.temp), "\n")
##D 
##D  # Confidence intervals of Bootstrap of effect size for Wind
##D  p=0.95
##D  y <- sort(es.boot.wind) 
##D  x <- 1:length(y)
##D    plx <- stats::predict(stats::loess(y ~ x), se=TRUE)
##D    lci = plx$fit - stats::qt(p, plx$df) * plx$se.fit
##D    uci = plx$fit + stats::qt(p, plx$df) * plx$se.fit
##D        graphics::plot(x, y, type="n", main="Effect size Bootstrap CI for Wind", 
##D  	    sub=paste("confidence intervals at", p))
##D        graphics::polygon(c(x,rev(x)), c(lci, rev(uci)), col="grey86")
##D        graphics::points(x, y, pch=20, cex=0.70)
##D        graphics::lines(x, plx[["fit"]], lty=3)
##D  
##D  # Confidence intervals of Bootstrap of effect size for Temp
##D  p=0.95
##D  y <- sort(es.boot.temp) 
##D  x <- 1:length(y)
##D    plx <- stats::predict(stats::loess(y ~ x), se=TRUE)
##D    lci = plx$fit - stats::qt(p, plx$df) * plx$se.fit
##D    uci = plx$fit + stats::qt(p, plx$df) * plx$se.fit
##D        graphics::plot(x, y, type="n", main="Effect size Bootstrap CI for Temp", 
##D  	    sub=paste("confidence intervals at", p))
##D        graphics::polygon(c(x,rev(x)), c(lci, rev(uci)), col="grey86")
##D        graphics::points(x, y, pch=20, cex=0.70)
##D        graphics::lines(x, plx[["fit"]], lty=3)
##D  	  
##D  # Plot bootstrap of wind effect size
##D  pdf <- density(es.boot.wind)
##D  plot(pdf, type="n", main="Bootstrap of effect size wind (n=99)", 
##D       ylab="p", xlab="effect size")
##D    polygon(pdf, col="grey")
##D    abline(v=mean(es.boot.wind))
##D      abline(v=mean(es.boot.wind)-sd(es.boot.wind), col="blue", lty=3)
##D      abline(v=mean(es.boot.wind)+sd(es.boot.wind), col="blue", lty=3)	  
##D  
##D  # Plot bootstrap of temp effect size	
##D  pdf <- density(es.boot.temp)
##D  plot(pdf, type="n", main="Bootstrap of effect size temp (n=99)", 
##D       ylab="p", xlab="effect size")
##D    polygon(pdf, col="grey")	
##D    abline(v=mean(es.boot.temp))
##D      abline(v=mean(es.boot.temp)-sd(es.boot.temp), col="blue", lty=3)
##D      abline(v=mean(es.boot.temp)+sd(es.boot.temp), col="blue", lty=3)
## End(Not run)




