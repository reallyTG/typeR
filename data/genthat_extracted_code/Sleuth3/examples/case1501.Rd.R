library(Sleuth3)


### Name: case1501
### Title: Logging and Water Quality
### Aliases: case1501
### Keywords: datasets

### ** Examples

str(case1501)
attach(case1501)

## EXPLORATION
opar <- par(no.readonly=TRUE)  # Store current graphics parameters settings
par(mfrow=c(2,1))   # Set graphics parameters: 2 row, 1 column layout
plot(NoCut ~ Week,  type="b", ylab="Log of Nitrate Concentration; NoCut")
abline(h=mean(NoCut))  # Horizontal line at the mean
plot(Patch ~ Week,  type="b", ylab="Log of Nitrate Concentration; Patch Cut")         
abline(h=mean(Patch))
 
par(opar) # Restore previous graphics settings
lag.plot(NoCut,do.lines=FALSE)  # Lag plot for NoCut
lag.plot(Patch,do.lines=FALSE)  # Lag plot for Patch
pacf(NoCut)  # partial autocorrelation function plot; noCut
pacf(Patch)  # partial autocorrelation function plot; Patch

## INFERENCE  (2-sample comparison, accounting for first serial correlation)
diff     <- mean(Patch) - mean(NoCut)
nPatch   <- length(Patch)  # length of Patch series
nNoCut   <- length(NoCut)   # length of NoCut series
acfPatch <- acf(Patch, type="covariance")  # auto covariances for Patch series
c0Patch  <- acfPatch$acf[1]*nPatch/(nPatch-1) # variance; n-1 divisor (Patch) 
c1Patch  <- acfPatch$acf[2]*nPatch/(nPatch-1) # autocov; n-1 divisor (Patch)  
acfNoCut <- acf(NoCut, type="covariance") # auto covariances for NoCut series
c0NoCut  <- acfNoCut$acf[1]*nNoCut/(nNoCut - 1) # variance; n-1 divisor (NoCut)
c1NoCut  <- acfNoCut$acf[2]*nNoCut/(nNoCut - 1) # autocov; n-1 divisor (NoCut) 
dfPatch  <- nPatch - 1     # DF (n-1); Patch
dfNoCut  <- nNoCut - 1     # DF (n-1); NoCut

c0Pooled   <- (dfPatch*c0Patch + dfNoCut*c0NoCut)/(dfPatch + dfNoCut)
c0Pooled   #[1] 1.413295  = pooled estimate of variance
c1Pooled   <- (dfPatch*c1Patch + dfNoCut*c1NoCut)/(dfPatch + dfNoCut)
c1Pooled   #[1] 0.9103366 = pooled estimate of lag 1 covariance

# Pooled estimate of first serial correlation coefficient:
r1 <- c1Pooled/c0Pooled                  #[1] 0.6441233
SEdiff  <- sqrt((1 + r1)/(1-r1))*sqrt(c0Pooled*(1/nPatch + 1/nNoCut))    

# t-test and confidence interval
tStat      <- diff/SEdiff #[1] 0.2713923
pValue     <- 1 - pt(tStat,dfPatch + dfNoCut)     # One-sided p-value   
halfWidth  <- qt(.975,dfPatch + dfNoCut)*SEdiff   # half width of 95% CI
diff + c(-1,1)*halfWidth  #95% CI -0.6557578  0.8648487

## GRAPHICAL DISPLAY FOR PRESENTATION  
par(mfrow=c(1,1))                   # Reset mfrow to a single plot per page
plot(exp(Patch) ~ Week, # Use exp(Patch) to show results in original units
  log="y", type="b", xlab="Weeks After Logging",
  ylab="Nitrate Concentration in Watershed Runoff (ppm)",
  main="Nitrate Series in Patch-Cut and Undisturbed Watersheds",
  pch=21, col="dark green", lwd=3, bg="green", cex=1.3 ) 
points(exp(NoCut) ~ Week, pch=24, col="dark blue", lwd=3, bg="orange",cex=1.3)
lines(exp(NoCut) ~ Week, lwd=3, col="dark blue",lty=3)            
abline(h=exp(mean(Patch)),col="dark green",lwd=2)
abline(h=exp(mean(NoCut)),col="dark blue", lwd=2,lty=2)
legend(205,100,legend=c("Patch Cut", "Undisturbed"),
  pch=c(21,24), col=c("dark green","dark blue"), pt.bg = c("green","orange"),
  pt.cex=c(1.3,1.3), lty=c(1,3), lwd=c(3,3))
text(-1, 8.5, "Mean",col="dark green")
text(-1,6.3,"Mean", col="dark blue")


detach(case1501)



