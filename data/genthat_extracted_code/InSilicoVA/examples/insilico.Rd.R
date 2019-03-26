library(InSilicoVA)


### Name: insilico
### Title: Implement InSilicoVA methods
### Aliases: insilico
### Keywords: InSilicoVA

### ** Examples

## Not run: 
##D data(RandomVA1) 
##D fit0<- insilico(RandomVA1, subpop = NULL,  
##D                 Nsim = 20, burnin = 10, thin = 1 , seed = 1,
##D 			 auto.length = FALSE)
##D summary(fit0)
##D summary(fit0, id = "d199")
##D 
##D ##
##D ## Scenario 1: standard input without sub-population specification
##D ##
##D fit1<- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D 		   auto.length = FALSE)
##D summary(fit1)
##D plot(fit1)
##D 
##D ##
##D ## Scenario 2: standard input with sub-population specification
##D ##
##D data(RandomVA2)
##D fit2<- insilico(RandomVA2, subpop = list("sex"),  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D 		   auto.length = FALSE)
##D summary(fit2)
##D plot(fit2, type = "compare")
##D plot(fit2, which.sub = "Men")
##D 
##D ##
##D ## Scenario 3: standard input with multiple sub-population specification
##D ##
##D fit3<- insilico(RandomVA2, subpop = list("sex", "age"),  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D 		   auto.length = FALSE)
##D summary(fit3)
##D 
##D ##
##D ## Scenario 3: standard input with multiple sub-population specification
##D ##
##D fit3<- insilico(RandomVA2, subpop = list("sex", "age"),  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D 		   auto.length = FALSE)
##D summary(fit3)
##D 
##D ##
##D ## Scenario 5 - 7 are special situations rarely needed in practice,
##D ##   but included here for completeness. 
##D ##   The below examples use no sub-population or physician codes, 
##D ##   but specifying sub-population is still possible as in Scenario 2 - 4.
##D ## 
##D 
##D ##
##D ## Scenario 5: skipping re-estimation of conditional probabilities
##D ##
##D # Though in practice the need for this situation is very unlikely, 
##D # use only the default conditional probabilities without re-estimation
##D fit5<- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D               updateCondProb = FALSE, 
##D 		   auto.length = FALSE) 
##D summary(fit5)
##D 
##D ##
##D ## Scenario 6: modify default conditional probability matrix
##D ##
##D # Load the default conditional probability matrix 
##D data(condprob)
##D # The conditional probabilities are given in levels such as I, A+, A, A-, etc.
##D condprob[1:5, 1:5]
##D # To modify certain cells 
##D new_cond_prob <- condprob
##D new_cond_prob["elder", "HIV/AIDS related death"] <- "C"
##D # or equivalently
##D new_cond_prob[1, 3] <- "C"
##D 
##D fit6<- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D               CondProb = new_cond_prob, 
##D 		   auto.length = FALSE) 
##D # note: compare this with fit1 above to see the change induced 
##D #  by changing Pr(elder | HIV) from "C+" to "C".
##D summary(fit6)
##D 
##D ##
##D ## Scenario 7: modify default numerical values in conditional probabilities directly
##D ##
##D # Load the default conditional probability matrix 
##D data(condprobnum)
##D # The conditional probabilities are given in numerical values in this dataset
##D condprobnum[1:5, 1:5]
##D # To modify certain cells, into any numerical values you want 
##D new_cond_prob_num <- condprobnum
##D new_cond_prob_num["elder", "HIV/AIDS related death"] <- 0.004
##D # or equivalently
##D new_cond_prob_num[1, 3] <- 0.005
##D 
##D fit7<- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D               CondProbNum = new_cond_prob_num, 
##D 		   auto.length = FALSE) 
##D # note: compare this with fit1, fit5, and fit6
##D summary(fit7)
##D 
##D ##
##D ## Scenario 8: physician coding
##D ## see also the examples in physician_debias() function section
##D ##
##D # Load sample input for physicians
##D data(RandomPhysician)
##D # The symptom section looks the same as standard input
##D head(RandomPhysician[, 1:5])
##D # At the end of file, including a few more columns of physician id and coded cause
##D head(RandomPhysician[, 245:250])
##D 
##D # load Cause Grouping (if physician-coded causes are in larger categories)
##D data(SampleCategory)
##D head(SampleCategory)
##D 
##D # existing doctor codes in the sample dataset
##D doctors <- paste0("doc", c(1:15))
##D causelist <- c("Communicable", "TB/AIDS", "Maternal",
##D                "NCD", "External", "Unknown")
##D phydebias <- physician_debias(RandomPhysician, 
##D phy.id = c("rev1", "rev2"), phy.code = c("code1", "code2"), 
##D phylist = doctors, causelist = causelist, 
##D tol = 0.0001, max.itr = 100)
##D 
##D fit8 <- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D               phy.debias = phydebias,
##D               phy.cat = SampleCategory, 
##D               phy.external = "External", phy.unknown = "Unknown",
##D 		   auto.length = FALSE) 
##D summary(fit8)
##D 
##D # example to fit WHO2016 data
##D data(RandomVA5)
##D fit1a <- insilico(RandomVA5, data.type="WHO2016", subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D 		   auto.length = FALSE)
##D summary(fit1a)
##D plot(fit1)
##D 
##D # example to change directory for error files
##D fit1b <- insilico(RandomVA5[1:50, ], data.type="WHO2016", 
##D 					Nsim = 1000, burnin = 500, thin = 10 , 
##D 					seed = 1, warning.write = T, auto.length=F)
##D fit1c <- insilico(RandomVA5[1:50, ], data.type="WHO2016", 
##D 					Nsim = 1000, burnin = 500, thin = 10 , 
##D 					seed = 1, warning.write = T, 
##D 					directory = "fit1b_errorfolder", auto.length=F)
##D 
##D  # similarly for WHO 2012 version
##D fit1<- insilico(RandomVA1, subpop = NULL,  
##D               Nsim = 1000, burnin = 500, thin = 10 , seed = 1,
##D 		         auto.length = FALSE, 
##D 				 warning.write = T, directory = "fit1_errorfolder")
##D 
## End(Not run)



