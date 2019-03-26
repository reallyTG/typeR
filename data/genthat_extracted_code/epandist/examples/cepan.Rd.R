library(epandist)


### Name: cepan
### Title: Calculate censoring point
### Aliases: cepan
### Keywords: distribution

### ** Examples

#Censoring point of a left-censored epan-distributed variable
#with an expected value of 3 (given mu=0 and r=16):
cepan(ev=3,mu=0,r=16)

#Censoring point of a right-censored epan-distributed variable
#with an expected value of 103 (given mu=100 and r=32):
cepan(ev=94,mu=100,r=32,side_censored="right")
#Results are usually not an integer though and rarely coinciding with mu



