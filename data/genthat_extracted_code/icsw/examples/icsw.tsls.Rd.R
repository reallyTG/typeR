library(icsw)


### Name: icsw.tsls
### Title: Two-stage least squares with inverse complier score weighting
### Aliases: icsw.tsls icsw.tsls.fit
### Keywords: ~kwd1 ~kwd2

### ** Examples


# Load example dataset, see help(FoxDebate) for details
data(FoxDebate)

# Ipw reweighting step Aronow and Carnegie (2013) use for missing data
covmat <- with(FoxDebate, cbind(partyid, pnintst, watchnat, educad, readnews, gender, 
                                income, white))

# IPW reweighting step Aronow and Carnegie (2013) use for missing data
Ymis <- is.na(FoxDebate[, "infopro"])

IPWweight <- 1 / (1 - predict(glm(Ymis ~ covmat, family = binomial(link = "probit")),
                                  type = "response"))
IPWweight[Ymis] <- 0

N <- length(FoxDebate[, "infopro"])
alpha <- 0.275

# Compute the ATE of watching the Fox Debate on knowledge . This replicates the 
#   ATE from column 2 of Table 1 in Aronow and Carnegie (2013) 
icsw.out <- with(FoxDebate, icsw.tsls(D = watchpro, X = cbind(1, covmat), 
                                          Y = infopro, Z = conditn, W = covmat,
                                          min.prob.quantile = 1 / (N^alpha),
                          weights = IPWweight))
round(icsw.out$coefficients["D"], 2)

# Example with bootstrap (this takes awhile!)
## No test: 
icsw.out <- with(FoxDebate, icsw.tsls(D = watchpro, X = cbind(1, covmat), 
                                      Y = infopro, Z = conditn, W = covmat,
                                      min.prob.quantile = 1 / (N^alpha), 
                                      weights = IPWweight, R = 1000))

# Display vector of coefficients
icsw.out$coefficients

# Display vector of (bootstrapped) SEs
icsw.out$coefs.se.boot
## End(No test)



