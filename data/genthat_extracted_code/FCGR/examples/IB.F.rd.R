library(FCGR)


### Name: IB.F
### Title: Bootstrap confidence bands for fatigue lifetime
### Aliases: IB.F
### Keywords: IB.F

### ** Examples

## Not run: 
##D ## Using the Alea.A dataset
##D data(Alea.A)
##D x <- Alea.A
##D ## Critical crack length
##D aF <- 1.6    
##D ## Censoring time         
##D T_c <- 0.12           
##D ## cracks.growth function applied to Alea.A data
##D cg <- cracks.growth(x, aF, T_c, method = c("SEP-lme_bkde", "SEP-lme_kde",
##D                      "PB-nlme"), nBKDE = 5000, nKDE = 5000, nMC = 5000) 
##D ## z is a cracks.growth object
##D z <- cg
##D ## Number of bootstrap resamplings
##D nB <- 100 
##D ## Application of IB.F function to cg object
##D ic.b <- IB.F(z, nB, alpha = 0.05, method = c("SEP-lme_bkde", "SEP-lme_kde",
##D            "PB-nlme")) 
##D ## ic.b values obtainde by the "SEP-lme_bkde" model
##D names(ic.b)
##D # [1] "Mat.F.B"     "I.Bootstrap" 
##D ## Chart with the empirical and estimated distribution functions,
##D ## with bootstrap confidence bands at 95##D 
##D # Observations from which the distribution function is estimated 
##D F1.F <- z$F.est[,2]  
##D plot( ic.b$I.Bootstrap$low,F1.F, col=2, type="l", lty=2, lwd=2, 
##D           xlim=c(0.05,0.18),
##D           main="Plot: distributions of failure times\n  confidence intervals",
##D           xlab="million cycles",  ylab="probability",  cex.lab=1.7,
##D           cex.main=2, las=1)
##D lines(ic.b$I.Bootstrap$up, F1.F, col=2, lty=2, lwd=2)
##D points(z$F.est, pch=20)
##D points(z$F.emp, col=4, pch=20, cex=1.5)
##D legend("topleft", c("Empirical", "Estimated","Bootstrap (95 percent)"),
##D               col=c("blue","black","red"),  lty=c(1,1,1), pch=c(20,20,20),
##D               cex=1.5, bty="n")
##D ## Graph with confidence bands
##D matplot(ic.b$Mat.F.B, F1.F,  main="Bootstrap resampling lines",  
##D          type="l", lwd=2, xlim=c(0.05,0.18), xlab="million cycles", 
##D          ylab="probability", cex.lab=1.7,  cex.main=2, las=1)
## End(Not run)



