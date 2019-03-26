library(MortCast)


### Name: MortCast-package
### Title: MortCast: Estimation and Projection of Age-Specific Mortality
###   Rates
### Aliases: MortCast MortCast-package

### ** Examples

# This example applies Algorithm 2 in Sevcikova et al. (2016) 
# on data from WPP2017 for China
#
data(mxM, mxF, e0Fproj, e0Mproj, package = "wpp2017")
country <- "China"

# extract observed mortality rates for male and female
mxm <- subset(mxM, name == country)[,4:16]
mxf <- subset(mxF, name == country)[,4:16]
rownames(mxm) <- rownames(mxf) <- c(0,1, seq(5, 100, by=5))

# Step 1: extrapolate from 100+ to 130+ using Coherent Kannisto
mx130 <- cokannisto(mxm, mxf)
 
# Steps 2-5: estimate coherent Lee-Carter parameters
# (here ax is computed from the last observed period 
# and smoothened over ages)
lc.est <- lileecarter.estimate(mx130$male, mx130$female, 
            ax.index = ncol(mx130$male), ax.smooth = TRUE)
        
# Steps 6-9: project future mortality rates based on future 
# life expectancies from WPP2017
e0f <- as.numeric(subset(e0Fproj, name == country)[-(1:2)])
e0m <- as.numeric(subset(e0Mproj, name == country)[-(1:2)])
names(e0f) <- names(e0m) <- colnames(e0Fproj)[-(1:2)]
pred <- mortcast(e0m, e0f, lc.est)

# plot projection for the first and last future time period
plot(pred$female$mx[,"2015-2020"], type="l", log="y", 
    ylim=range(pred$female$mx, pred$male$mx), xaxt="n",
    ylab="mx", xlab="Age", main=country, col="red")
axis(1, at=1:nrow(pred$female$mx),
    labels=rownames(pred$female$mx))
lines(pred$male$mx[,"2015-2020"], col="blue")
lines(pred$female$mx[,"2095-2100"], col="red", lty=2)
lines(pred$male$mx[,"2095-2100"], col="blue", lty=2)
legend("topleft", legend=c("male 2015-2020", "female 2015-2020",
    "male 2095-2100", "female 2095-2100"), bty="n",
    col=rep(c("blue", "red"),2), lty=c(1,1,2,2))




