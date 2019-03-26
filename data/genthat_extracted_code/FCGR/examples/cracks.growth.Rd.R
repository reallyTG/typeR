library(FCGR)


### Name: cracks.growth
### Title: Fatigue crack growth in reliability analysis
### Aliases: cracks.growth
### Keywords: cracks.growth

### ** Examples

## Not run: 
##D ## Using the Alea.A dataset
##D data(Alea.A)
##D x <-  Alea.A
##D ## Critical crack length
##D aF <- 1.6    
##D ## Censoring time         
##D T_c <- 0.12           
##D ## cracks.growth function applied to Alea.A data
##D cg <- cracks.growth (x, aF, T_c, method = c("SEP-lme_bkde", "SEP-lme_kde",
##D                    "PB-nlme"), nBKDE = 5000, nKDE = 5000, nMC = 5000) 
##D ## cracks.growth values using the "SEP-lme_bkde" by default method.
##D names(cg)
##D # [1]	 "data"       "a.F"        "Tc"         "param"      "crack.est"
##D # [6] 	"sigma"      "residuals"  "crack.pred" "F.emp"      "bw"
##D #[11]	 "F.est"      "nBKDE"
## End(Not run)



