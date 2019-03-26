library(BayesSAE)


### Name: replication
### Title: Replicated Data
### Aliases: replication

### ** Examples

#load data set
data(SAIPE)

#obtain MCMC draws
result <- BayesSAE(SACPR~SNAPR+CenPR+CPER|Vardir, data = SAIPE, mcmc = 5000)

#obtain replicated data
replication(result)



