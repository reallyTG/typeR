library(BTYD)


### Name: dc.PlotLogLikelihoodContours
### Title: Plot Log-Likelihood Contour
### Aliases: dc.PlotLogLikelihoodContours

### ** Examples

# **Example for BG/BB model:
data(donationsSummary)
rf.matrix <- donationsSummary$rf.matrix

# starting-point parameters
bgbb.startingparams <- c(1, 1, 0.5, 3)
# estimated parameters
bgbb.est.params <- bgbb.EstimateParameters(rf.matrix, bgbb.startingparams)

# set up parameter names for a more descriptive result
bgbb.param.names <- c("alpha", "beta", "gamma", "delta")

# plot-log likelihood contours (not run):
# dc.PlotLogLikelihoodContours(bgbb.rf.matrix.LL, bgbb.est.params, rf.matrix = rf.matrix,
# 	n.divs = 5, num.contour.lines = 8, zoom.percent = 0.3, allow.neg.params = FALSE,
#	param.names = bgbb.param.names)

# **Example for Pareto/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# Speed up calculations:
cbs <- pnbd.compress.cbs(cbs)

# parameters estimated using pnbd.EstimateParameters
pnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
pnbd.param.names <- c("r", "alpha", "s", "beta")

# plot log-likelihood contours (not run):
# dc.PlotLogLikelihoodContours(pnbd.cbs.LL, pnbd.est.params, cal.cbs = cbs, n.divs = 5,
#                           num.contour.lines = 15, zoom.percent = 0.3,
#                            allow.neg.params = FALSE, param.names = pnbd.param.names)

# **Example for BG/NBD model:
data(cdnowSummary)
cbs <- cdnowSummary$cbs

# parameters estimated using bgnbd.EstimateParameters
bgnbd.est.params <- cdnowSummary$est.params

# set up parameter names for a more descriptive result
bgnbd.param.names <- c("r", "alpha", "s", "beta")

# plot log-likelihood contours (not run):
# dc.PlotLogLikelihoodContours(bgnbd.cbs.LL, bgnbd.est.params, cal.cbs = cbs, n.divs = 5,
#                            num.contour.lines = 15, zoom.percent = 0.3,
#                            allow.neg.params = FALSE, param.names = bgnbd.param.names)



