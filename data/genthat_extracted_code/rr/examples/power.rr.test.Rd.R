library(rr)


### Name: power.rr.test
### Title: Power Analysis for Randomized Response
### Aliases: power.rr.test
### Keywords: analysis power

### ** Examples



## Calculate the power to detect a sensitive item proportion of .2
## with the forced design with known probabilities of 2/3 in truth-telling group,
## 1/6 forced to say "yes" and 1/6 forced to say "no" and sample size of 200.

power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = 200, 
             presp = .2, presp.null = 0,
             design = "forced-known", sig.level = .01,
             type = "one.sample", alternative = "one.sided")
				       
## Not run: 
##D 
##D ## Find power varying the number of respondents from 250 to 2500 and 
##D ## the population proportion of respondents possessing the sensitive 
##D ## trait from 0 to .15
##D 
##D presp.seq <- seq(from = 0, to = .15, by = .0025)
##D n.seq <- c(250, 500, 1000, 2000, 2500)
##D power <- list()
##D for(n in n.seq) {
##D     power[[n]] <- rep(NA, length(presp.seq))
##D     for(i in 1:length(presp.seq))
##D         power[[n]][i] <- power.rr.test(p = 2/3, p1 = 1/6, p0 = 1/6, n = n, 
##D                                        presp = presp.seq[i], presp.null = 0,
##D                                        design = "forced-known", sig.level = .01, 
##D                                        type = "one.sample",
##D                                        alternative = "one.sided")$power
##D     }
##D     
##D ## Replicates the results for Figure 2 in Blair, Imai, and Zhou (2014)
## End(Not run)




