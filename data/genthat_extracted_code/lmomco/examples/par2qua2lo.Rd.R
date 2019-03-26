library(lmomco)


### Name: par2qua2lo
### Title: Equivalent Quantile Function of Two Distributions Stemming from
###   Left-Hand Threshold to Setup Conditional Probability Computations
### Aliases: par2qua2lo
### Keywords: quantile mixture function distribution (mixture) mixed
###   distribution conditional probability probability (conditional)
###   logistic regression generalized linear model binomial family logit
###   link

### ** Examples

## Not run: 
##D XloSNOW <- list( # data from "snow events" from prior call to x2xlo()
##D    xin=c(4670, 3210, 4400, 4380, 4350, 3380, 2950, 2880, 4100),
##D    ppin=c(0.9444444, 0.6111111, 0.8888889, 0.8333333, 0.7777778, 0.6666667,
##D           0.5555556, 0.5000000, 0.7222222),
##D    xout=c(1750, 1610, 1750, 1460, 1950, 1000, 1110, 2600),
##D    ppout=c(0.27777778, 0.22222222, 0.33333333, 0.16666667, 0.38888889,
##D            0.05555556, 0.11111111, 0.44444444),
##D    pp=0.4444444, thres=2600, nin=9, nout=8, n=17, source="x2xlo")
##D # RAIN data from prior call to x2xlo() are
##D XloRAIN <- list( # data from "rain events" from prior call to x2xlo()
##D    xin=c(5240, 6800, 5990, 4600, 5200, 6000, 4500, 4450, 4480, 4600,
##D          3290, 6700, 10600, 7230, 9200, 6540, 13500, 4250, 5070,
##D          6640, 6510, 3610, 6370, 5530, 4600, 6570, 6030, 7890, 8410),
##D    ppin=c(0.41935484, 0.77419355, 0.48387097, 0.25806452, 0.38709677, 0.51612903,
##D           0.22580645, 0.16129032, 0.19354839, 0.29032258, 0.06451613, 0.74193548,
##D           0.93548387, 0.80645161, 0.90322581, 0.64516129, 0.96774194, 0.12903226,
##D           0.35483871, 0.70967742, 0.61290323, 0.09677419, 0.58064516, 0.45161290,
##D           0.32258065, 0.67741935, 0.54838710, 0.83870968, 0.87096774),
##D    xout=c(1600), ppout=c(0.03225806),
##D    pp=0.03225806, thres=2599, nin=29, nout=1, n=30, source="x2xlo")
##D 
##D QSNOW <- c(XloSNOW$xin,  XloSNOW$xout ) # collect all of the snow
##D QRAIN <- c(XloRAIN$xin,  XloRAIN$xout ) # collect all of the rain
##D PSNOW <- c(XloSNOW$ppin, XloSNOW$ppout) # probabilities collected
##D PRAIN <- c(XloRAIN$ppin, XloRAIN$ppout) # probabilities collected
##D 
##D # Logistic regression to blend the proportion of snow versus rain events as
##D # ***also*** a function of nonexceedance probability
##D wfunc <- par2qua2lo(xlo1=XloSNOW, xlo2=XloRAIN, wfunc="wfunc") # weight function
##D 
##D # Plotting the data and the logistic regression. This shows how to gain access
##D # to the attributes, in order to get the data, so that we can visualize the
##D # probability mixing between the two samples. If the two samples are not a
##D # function of probability, then each systematically would have a regression-
##D # predicted weight of 50/50. For the RAIN and SNOW, the SNOW is likely to
##D # produce the smaller events and RAIN the larger.
##D  opts <- par(las=1) # Note the 0.5 in the next line is arbitrary, we simply
##D  bin <- attr(wfunc(0.5), "data") # have to use wfunc() to get its attributes.
##D  FF <- seq(0,1,by=0.01); HH <- wfunc(FF); n <- length(FF)
##D  plot(bin$f, bin$prob, tcl=0.5, col=2*bin$prob+2,
##D       xlab="NONEXCEEDANCE PROBABILITY", ylab="RAIN-CAUSED EVENT RELATIVE TO SNOW")
##D  lines(c(-0.04,1.04), rep(0.5,2), col=8, lwd=0.8) # origin line at 50/50 chance
##D  text(0, 0.5, "50/50 chance line", pos=4, cex=0.8)
##D  segments(FF[1:(n-1)], HH[1:(n-1)], x1=FF[2:n], y1=HH[2:n], lwd=1+4*abs(FF-0.5),
##D           col=rgb(1-FF,0,FF)) # line grades from one color to other
##D  text(1, 0.1, "Events caused by snow", col=2, cex=0.8, pos=2)
##D  text(0, 0.9, "Events caused by rain", col=4, cex=0.8, pos=4)
##D  par(opts)
##D 
##D # Suppose that the Pearson type III is thought applicable to the SNOW
##D # and the AEP4 for the RAIN, now estimate respective parameters.
##D parSNOW <- lmr2par(log10(XloSNOW$xin), type="nor" )
##D parRAIN <- lmr2par(log10(XloRAIN$xin), type="wak")
##D # Two distributions are chosen to show the user than we are not constrained to one.
##D 
##D Qall   <- c(QSNOW, QRAIN)                # combine into a "whole" sample
##D XloALL <- x2xlo(Qall, leftout=2600, a=0) # apply the low-outlier threshold
##D parALL <- lmr2par(log10(XloALL$xin), type="nor") # estimate Wakeby
##D # Wakey has five parameters and is very flexible.
##D 
##D FF <- nonexceeds() # useful nonexceedance probabilities
##D col <- c(rep(0,length(QSNOW)), rep(2,length(QRAIN))) # for coloring
##D plot(0, 0, col=2+col, ylim=c(1000,20000), xlim=qnorm(range(FF)), log="y",
##D            xlab="STANDARD NORMAL VARIATE", ylab="QUANTILE", type="n")
##D lines(par()$usr[1:2], rep(2600, 2), col=6, lty=2, lwd=0.5) # draw threshold
##D points(qnorm(pp(Qall, sort=FALSE)), Qall, col=2+col, lwd=0.98) # all record
##D points(qnorm(PSNOW), QSNOW, pch=16, col=2) # snow events
##D points(qnorm(PRAIN), QRAIN, pch=16, col=4) # rain events
##D lines(     qnorm(f2f(  FF, xlo=XloSNOW)), # show fitted curve for snow events
##D       10^par2qua(f2flo(FF, xlo=XloSNOW ), parSNOW), col=2)
##D lines(     qnorm(f2f(  FF, xlo=XloRAIN)), # show fitted curve for rain events
##D       10^par2qua(f2flo(FF, xlo=XloRAIN ), parRAIN), col=4)
##D lines(     qnorm(f2f(  FF, xlo=XloALL )), # show fitted curve for all events combined
##D       10^par2qua(f2flo(FF, xlo=XloALL  ), parALL ), col=1, lty=3)
##D PQ <- par2qua2lo(      FF, parSNOW, parRAIN, XloSNOW, XloRAIN, wfunc=wfunc)
##D lines(qnorm(PQ$f), 10^PQ$quamix, lwd=2)                  # draw the mixture
##D legend(-3,20000, c("Rain curve", "Snow curve", "All combined (all open circles)",
##D                     "MIXED CURVE by par2qua2lo()"),
##D                   bty="n", lwd=c(1,1,1,2), lty=c(1,1,3,1), col=c(4,2,1,1))
##D text(-3, 15000, "A low-outlier threshold of 2,600 is used throughout.", col=6, pos=4)
##D text(-3,  2600, "2,600", cex=0.8, col=6, pos=4)
##D mtext("Mixed population frequency computation of snow and rainfall streamflow")#
## End(Not run)

## Not run: 
##D nsim <- 50000; FF <- runif(nsim); WF <- wfunc(FF)
##D rB <- rbinom(nsim, 1, WF)
##D RF <- FF[rB == 1]; SF <- FF[rB == 0]
##D RAIN <- 10^qlmomco(f2flo(runif(length(RF)), xlo=XloRAIN), parRAIN)
##D SNOW <- 10^qlmomco(f2flo(runif(length(SF)), xlo=XloRAIN), parSNOW)
##D RAIN[RAIN < XloRAIN$thres] <- XloRAIN$thres
##D SNOW[SNOW < XloSNOW$thres] <- XloSNOW$thres
##D RAIN <- c(RAIN,rep(XloRAIN$thres, length(RF)-length(RAIN)))
##D SNOW <- c(SNOW,rep(XloSNOW$thres, length(SF)-length(SNOW)))
##D ALL <- c(RAIN,SNOW)
##D lines(qnorm(pp(ALL)), sort(ALL), cex=0.6, lwd=0.8, col=3)
##D 
##D RF <- FF[rB == 1]; SF <- FF[rB == 0]
##D RAIN <- 10^qlmomco(RF, parRAIN)
##D SNOW <- 10^qlmomco(SF, parSNOW)
##D RAIN[RAIN < XloRAIN$thres] <- XloRAIN$thres
##D SNOW[SNOW < XloSNOW$thres] <- XloSNOW$thres
##D RAIN <- c(RAIN,rep(XloRAIN$thres, length(RF)-length(RAIN)))
##D SNOW <- c(SNOW,rep(XloSNOW$thres, length(SF)-length(SNOW)))
##D ALL <- c(RAIN,SNOW)
##D lines(qnorm(pp(ALL)), sort(ALL), cex=0.6, lwd=0.8, col=3)
##D 
##D RF <- FF[rB == 1]; SF <- FF[rB == 0]
##D RAIN <- 10^qlmomco(f2flo(RF, xlo=XloRAIN), parRAIN)
##D SNOW <- 10^qlmomco(f2flo(SF, xlo=XloRAIN), parSNOW)
##D RAIN[RAIN < XloRAIN$thres] <- XloRAIN$thres
##D SNOW[SNOW < XloSNOW$thres] <- XloSNOW$thres
##D RAIN <- c(RAIN,rep(XloRAIN$thres, length(RF)-length(RAIN)))
##D SNOW <- c(SNOW,rep(XloSNOW$thres, length(SF)-length(SNOW)))
##D ALL <- c(RAIN,SNOW)
##D lines(qnorm(pp(ALL)), sort(ALL), cex=0.6, lwd=0.8, col=3) #
## End(Not run)



