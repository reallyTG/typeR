library(BayesSAE)


### Name: summary.BayesSAE
### Title: Extract Information from Object BayesSAE
### Aliases: summary.BayesSAE print.summary.BayesSAE MCMC

### ** Examples

# load data set
data(SAIPE)

# obtain posterior draws
result <- BayesSAE(SACPR~SNAPR+CenPR+CPER|Vardir, data = SAIPE, mcmc = 5000)

# summary information
summary(result)



