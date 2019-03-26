library(lmomco)


### Name: lmomrice
### Title: L-moments of the Rice Distribution
### Aliases: lmomrice
### Keywords: L-moment (distribution) Distribution: Rice

### ** Examples

## Not run: 
##D lmomrice(vec2par(c(65,34), type="rice"))
##D 
##D # Use the additional arguments to show how to avoid unnecessary overhead
##D # when using the Rice, which only has two parameters.
##D   rice <- vec2par(c(15,14), type="rice")
##D   system.time(lmomrice(rice, nmom=2)); system.time(lmomrice(rice, nmom=6))
##D 
##D   lcvs <- vector(mode="numeric"); i <- 0
##D   SNR  <- c(seq(7,0.25, by=-0.25), 0.1)
##D   for(snr in SNR) {
##D     i <- i + 1
##D     rice    <- vec2par(c(10,10/snr), type="rice")
##D     lcvs[i] <- lmomrice(rice, nmom=2)$ratios[2]
##D   }
##D   plot(lcvs, SNR,
##D        xlab="COEFFICIENT OF L-VARIATION",
##D        ylab="LOCAL SIGNAL TO NOISE RATIO (NU/ALPHA)")
##D   lines(.lmomcohash$RiceTable$LCV,
##D         .lmomcohash$RiceTable$SNR)
##D   abline(1,0, lty=2)
##D   mtext("Rice Distribution")
##D   text(0.15,0.5, "More noise than signal")
##D   text(0.15,1.5, "More signal than noise")
## End(Not run)
## Not run: 
##D # A polynomial expression for the relation between L-skew and 
##D # L-kurtosis for the Rice distribution can be readily constructed.
##D T3 <- .lmomcohash$RiceTable$TAU3
##D T4 <- .lmomcohash$RiceTable$TAU4
##D LM <- lm(T4~T3+I(T3^2)+I(T3^3)+I(T3^4)+
##D                I(T3^5)+I(T3^6)+I(T3^7)+I(T3^8))
##D summary(LM) # note shown
## End(Not run)



