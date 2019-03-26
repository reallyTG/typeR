library(icsw)


### Name: tsls.wfit
### Title: Fit instrumental variables model via two-stage least squares,
###   with weights.
### Aliases: tsls.wfit
### Keywords: ~kwd1 ~kwd2

### ** Examples

# Load example dataset, see help(FoxDebate) for details
data(FoxDebate)

# Estimate compliance scores with covariates, assuming (default) 
#   case of two-sided non-compliance.
covmat <- with(FoxDebate, cbind(partyid, pnintst, watchnat, educad, readnews, gender, 
                                income, white))

cscoreout <- with(FoxDebate, compliance.score(D = watchpro, Z = conditn,
                              W = covmat))

# Extract vector of estimated compliance scores
cscore <- cscoreout$C.score

# Winsorising as described in Aronow and Carnegie (2013)
N <- length(FoxDebate[, "infopro"])
alpha <- 0.275
qcscore <- quantile(cscore, 1 / (N^alpha))
cscore[cscore < qcscore] <- qcscore

# IPW reweighting step Aronow and Carnegie (2013) use for missing data
Ymis <- is.na(FoxDebate[,"infopro"])

IPWweight <- 1 / (1 - predict(glm(Ymis ~ covmat, family = binomial(link = "probit")), 
                              type = "response"))
IPWweight[Ymis] <- 0

# Compute LATE via 2SLS with IPW weights. This replicates 
#   Table 2 Column 1 in Aronow and Carnegie (2013)
outputTSLS <- with(FoxDebate, tsls.wfit(X = cbind(1, covmat, watchpro), Y = infopro, 
                        Z = cbind(1, covmat, conditn), weights = IPWweight))
round(outputTSLS$coefficients, 2)

# Compute ATE via 2SLS with (IPW weights / compliance scores). This
#   replicates Table 2 Column 2 in Aronow and Carnegie (2013)
outputICSW <- with(FoxDebate, tsls.wfit(cbind(1, watchpro, covmat), infopro, 
                        cbind(1, conditn, covmat), w = IPWweight / cscore))
round(outputICSW$coefficients, 2) 




