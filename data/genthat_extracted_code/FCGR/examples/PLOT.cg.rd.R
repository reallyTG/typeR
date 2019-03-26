library(FCGR)


### Name: PLOT.cg
### Title: Fatigue Crack Growth in Reliability plots
### Aliases: PLOT.cg
### Keywords: PLOT.cg()

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
##D cg <- cracks.growth (x, aF, T_c, method = c("SEP-lme_bkde", "SEP-lme_kde",
##D                      "PB-nlme"), nBKDE = 5000, nKDE = 5000, nMC = 5000) 
##D ## PLOT.cg applied to cg object.
##D PLOT <- PLOT.cg(cg) 
##D names(PLOT)
##D ## [1]  "plot.data"  "plot.pred"  "plot.F"     "plot.resid"
##D ## Exploratory chart for the Alea.A dataset
##D PLOT$plot.data(main = "Plot:  crack growth", xlab = "million cycles",
##D                              ylab = "cracks(inches)",  cex.lab=1.8,
##D                              cex.main = 2)
##D text(0.02, x$a.F + 0.05, "Failure", cex = 1.8)
##D text(0.095, 0.95, "Censoring time->", cex = 1.5)
##D ## Plot for fatigue lifetimes estimates and predictions.
##D PLOT$plot.pred(xlab = "million cycles", ylab = "cracks(inches)",
##D  main = "Plot: crack growth, estimation and prediction\n failure times (red)",
##D  cex.lab = 1.8, cex.main = 1.5)
##D text(0.02,x$a.F+0.05, "Failure", cex = 1.8)
##D text(0.085,0.95, "Censoring time->", cex = 1.5)  
##D ## Plot for the empirical distribution and lifetimes distribution estimates 
##D ## of  fatigue lifetimes
##D PLOT$plot.F(main = "Plot: distributions of failure times",
##D              xlab = "million cycles", ylab = "probability",
##D              cex.lab = 1.7, cex.main=2)
##D text(0.14, 0.1, "<-Censoring time", cex = 1.5)
##D legend("topleft", c("Empirical", "Estimated"), col = c("blue","black"),
##D         pch=c(20,20), cex=1.5, bty="n")
##D ## Residuals chart.
##D PLOT$plot.resid(main = "Plot: residual", xlab = "fitted", ylab = "residuals",
##D                  cex = 1.5, col = "blue", cex.lab = 1.7, cex.main = 2)
## End(Not run)



