library(BTYD)


### Name: dc.PlotLogLikelihoodContour
### Title: Plot Log-Likelihood Contour
### Aliases: dc.PlotLogLikelihoodContour

### ** Examples

# **Examples for BG/BB model:
data(donationsSummary)
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
bgbb.startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
bgbb.est.params <- bgbb.EstimateParameters(rf.matrix, bgbb.startingparams)

# set up parameter names for a more descriptive result
bgbb.param.names <- c("alpha", "beta", "gamma", "delta")

# plot a log-likelihood contour of alpha and beta, the unobserved
# parameters for the beta-Bernoulli transaction process of the BG/BB.
# Note that allow.neg.params has been set to false as BG/BB parameters
# cannot be negative (not run):
# dc.PlotLogLikelihoodContour(bgbb.rf.matrix.LL, c("vary", "vary", "fix", "fix"),
#                            bgbb.est.params, rf.matrix = rf.matrix, n.divs = 15,
#                            num.contour.lines = 15, zoom.percent = 0.2,
#                            allow.neg.params = FALSE, param.names = bgbb.param.names)

# plot a log-likelihood contour of gamma and delta, the unobserved
# parameters for the beta-geometric dropout process of the BG/BB.
# Note that allow.neg.params has been set to false as BG/BB parameters
# cannot be negative (not run):
# dc.PlotLogLikelihoodContour(bgbb.rf.matrix.LL, c("fix", "fix", "vary", "vary"),
#                            bgbb.est.params, rf.matrix = rf.matrix, n.divs = 15,
#                            num.contour.lines = 15, zoom.percent = 0.2,
#                            allow.neg.params = FALSE, param.names = bgbb.param.names)

# **Example for Pareto/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# Speed up calculations:
cbs <- pnbd.compress.cbs(cbs)

# parameters estimated using pnbd.EstimateParameters
pnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
pnbd.param.names <- c("r", "alpha", "s", "beta")

# plot a log-likelihood contour of r and s, the shape parameters
# of the transaction and dropout process models (respectively).
# Note that allow.neg.params has been set to false as Pareto/NBD
# parameters cannot be negative (not run):
# dc.PlotLogLikelihoodContour(pnbd.cbs.LL, c("vary", "fix", "vary", "fix"),
#                            pnbd.est.params, cal.cbs = cbs, n.divs = 20,
#                            num.contour.lines = 20, zoom.percent = 0.1,
#                            allow.neg.params = FALSE, param.names = pnbd.param.names)

# **Example for BG/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# parameters estimated using bgnbd.EstimateParameters
bgnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
bgnbd.param.names <- c("r", "alpha", "s", "beta")

# plot a log-likelihood contour of r and s, the shape parameters
# of the transaction and dropout process models (respectively).
# Note that allow.neg.params has been set to false as BG/NBD
# parameters cannot be negative (not run):
# dc.PlotLogLikelihoodContour(bgnbd.cbs.LL, c("vary", "fix", "vary", "fix"),
#                            bgnbd.est.params, cal.cbs = cbs, n.divs = 20,
#                            num.contour.lines = 20, zoom.percent = 0.1,
#                            allow.neg.params = FALSE, param.names = bgnbd.param.names)



