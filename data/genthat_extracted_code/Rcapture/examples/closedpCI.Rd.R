library(Rcapture)


### Name: closedpCI
### Title: Customization of a Loglinear Model and Confidence Interval for
###   Abundance Estimation in Closed Population Capture-Recapture
###   Experiments
### Aliases: closedpCI closedpCI.t closedpCI.0 print.closedpCI plotCI
###   boxplot.closedpCI plot.closedpCI
### Keywords: models

### ** Examples

data(hare)
CI <- closedpCI.t(hare, m = "Mth", h = "Poisson", h.control = list(theta = 2))
CI
plotCI(CI)

data(HIV)
mat <- histpos.t(4)
mX2 <- cbind(mat, mat[, 1] * mat[ ,2])
closedpCI.t(HIV, dfreq = TRUE, mX = mX2, mname = "Mt interaction 1,2")
# which can be obtained more conveniently with
closedpCI.t(HIV, dfreq = TRUE, mX = ~ . + c1:c2, mname = "Mt interaction 1,2")

data(BBS2001)
CI0 <- closedpCI.0(BBS2001, dfreq = TRUE, dtype = "nbcap", t = 50, t0 = 20,
                   m = "Mh", h = "Gamma", h.control = list(theta = 3.5))
CI0
plot(CI0)
plotCI(CI0)

### As an alternative to a gamma model, one can fit a negative Poisson model.
### It is appropriate in experiments where very small capture probabilities
### are likely. It can lead to very large estimators of abundance. 
data(mvole)
period3 <- mvole[, 11:15]
psi <- function(x) { 0.5^x - 1 }
closedpCI.t(period3, m = "Mh", h = psi)

### Example of normal heterogeneous models
### diabetes data of Bruno et al. (1994)
histpos <- histpos.t(4)
diabetes <- cbind(histpos, c(58,157,18,104,46,650,12,709,14,20,7,74,8,182,10))
# chosen interaction set I in Rivest (2011)
closedpCI.t(X = diabetes, dfreq = TRUE, mX = ~ . + c1:c3 + c2:c4 + c3:c4, 
            h = "Normal", mname = "Mth normal with I")

### Example of captures in continuous time
### Illegal immigrants data
data(ill)
closedpCI.0(ill, dtype = "nbcap", dfreq = TRUE, t = Inf, m = "Mh", h = "LB")



