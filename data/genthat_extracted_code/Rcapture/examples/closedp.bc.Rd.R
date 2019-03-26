library(Rcapture)


### Name: closedp.bc
### Title: Bias Correction for Closed Population Loglinear Models
### Aliases: closedp.bc print.closedp.bc
### Keywords: models

### ** Examples

data(mvole)
period3 <- mvole[, 11:15]
closedp.bc(period3, m = "Mh", h = "Darroch")
closedp.bc(period3, m = "Mh", h = "Gamma", h.control = list(theta = 3.5))

data(BBS2001)
closedp.bc(BBS2001, dfreq = TRUE, dtype = "nbcap", t = 50, t0 = 20,
           m = "Mh", h = "Gamma", h.control = list(theta = 3.5))

# Seber (1982) p.107
# When there are 2 capture occasions, only models M0 and Mt can be fitted
X <- matrix(c(1,1,167,1,0,781,0,1,254), byrow = TRUE, ncol = 3)
closedp.bc(X, dfreq = TRUE, m = "M0")
closedp.bc(X, dfreq = TRUE, m = "Mt") 



