library(rr)


### Name: power.rr.plot
### Title: Power Analysis Plot for Randomized Response
### Aliases: power.rr.plot
### Keywords: analysis power

### ** Examples


## Generate a power plot for the forced design with known 
## probabilities of 2/3 in truth-telling group, 1/6 forced to say "yes" 
## and 1/6 forced to say "no", varying the number of respondents from 
## 250 to 2500 and the population proportion of respondents 
## possessing the sensitive trait from 0 to .15.


presp.seq <- seq(from = 0, to = .15, by = .0025)
n.seq <- c(250, 500, 1000, 2000, 2500)
power.rr.plot(p = 2/3, p1 = 1/6, p0 = 1/6, n.seq = n.seq, 
              presp.seq = presp.seq, presp.null = 0,
              design = "forced-known", sig.level = .01, 
              type = "one.sample",
              alternative = "one.sided", legend = TRUE)
				       
    
## Replicates the results for Figure 2 in Blair, Imai, and Zhou (2014)




