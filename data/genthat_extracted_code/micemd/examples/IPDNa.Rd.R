library(micemd)


### Name: IPDNa
### Title: A simulated Individual Patient Data (IPD) meta-analysis with
###   missing values.
### Aliases: IPDNa
### Keywords: datasets

### ** Examples

data(IPDNa)

#summary
summary(IPDNa)

#summary per study
by(IPDNa,IPDNa$centre,summary)



