library(geiger)


### Name: pp.mcmc
### Title: using posterior predictive MCMC for modeling quantitative trait
###   evolution
### Aliases: pp.mcmc

### ** Examples

## No test: 
data(whales)

tmp <- treedata(whales$phy, whales$dat[,1])

phy <- tmp$phy
dat <- tmp$data[,1]

## compute observed statistics

nht.ols <- nh.test(phy, dat, regression.type = "lm",
log = TRUE, show.plot = FALSE)$coefficients[2,1]

nht.rlm <- nh.test(phy, dat, regression.type = "rlm",
 log = TRUE, show.plot = FALSE)$coefficients[2,1]

mdi.exp <- 0

#---- run short pp.mcmc 

pp.eb <- pp.mcmc(phy, dat, Ngens = 1000, sampleFreq = 10, printFreq = 100, model ="EB")

# ---- plot results

quartz(width = 5, height = 7)
par(mar = c(4,5,1,1))
par(mfcol = c(3,1))


hist(pp.eb$MDI, col = "gray", border = "gray", main = NULL, xlab = "pp.MDI", 
ylab = "Frequency", cex.axis = 1.2)

abline(v = mdi.exp, col = "black", lwd = 3, lty = 2)

mdi.p <- length(which(pp.eb$MDI<=0))/length(pp.eb$MDI)

hist(pp.eb$node.height.slope.lm, col = "gray", border = "gray", main = NULL, xlab = "pp.nht_ols", 
ylab = "Frequency", cex.axis = 1.2)

abline(v = nht.ols, col = "black", lwd = 3, lty = 2)

node.height.ols.p <- length(which(pp.eb$node.height.slope.lm <= nht.ols)) / 
(length(pp.eb$node.height.slope.lm) +1)


hist(pp.eb$node.height.slope.rlm, col = "gray", border = "gray", main = NULL, xlab = "pp.nht_ols", 
ylab = "Frequency", cex.axis = 1.2)

abline(v = nht.rlm, col = "black", lwd = 3, lty = 2)

node.height.rr.p <- length(which(pp.eb$node.height.slope.rlm <= nht.rlm)) / 
(length(pp.eb$node.height.slope.rlm) +1)

## End(No test)



