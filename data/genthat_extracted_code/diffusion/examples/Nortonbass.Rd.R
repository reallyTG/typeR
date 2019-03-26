library(diffusion)


### Name: Nortonbass
### Title: Norton-Bass model
### Aliases: Nortonbass
### Keywords: internal

### ** Examples

 ## Not run: 
##D    fitNB1 <- Nortonbass(tsIbm, startval.met = "2ST", estim.met = "OLS",
##D                         startval = NULL, flexpq = F, gstart = NULL)
##D    fitNB2 <- Nortonbass(tsIbm, startval.met = "2ST", estim.met = "SUR",
##D                         startval = NULL, flexpq = F, gstart = NULL)
##D    # using BOBYQA algorithm
##D    fitNB3 <- Nortonbass(tsIbm, startval.met = "2ST", estim.met = "BOBYQA",
##D                         startval = NULL, flexpq = F, gstart = NULL)
##D    # Create some plots
##D    plot(tsibm[, 1],type = "l", ylim=c(0,35000))
##D    lines(tsibm[, 2],col ="blue")
##D    lines(tsibm[, 3],col ="green")
##D    lines(tsibm[, 4],col ="pink")
##D    lines(fitNB1$fit$fitted[[1]], col = "black", lty = 2)
##D    lines(fitNB1$fit$fitted[[2]], col = "blue", lty = 2)
##D    lines(fitNB1$fit$fitted[[3]], col = "green", lty = 2)
##D    lines(fitNB1$fit$fitted[[4]], col = "pink", lty = 2)
##D    lines(fitNB2$fit$fitted[[1]], col = "black", lty = 3)
##D    lines(fitNB2$fit$fitted[[2]], col = "blue", lty = 3)
##D    lines(fitNB2$fit$fitted[[3]], col = "green", lty = 3)
##D    lines(fitNB2$fit$fitted[[4]], col = "pink", lty = 3)
##D    lines(fitNB3$fit$fitted[[1]], col = "black", lty = 4)
##D    lines(fitNB3$fit$fitted[[2]], col = "blue", lty = 4)
##D    lines(fitNB3$fit$fitted[[3]], col = "green", lty = 4)
##D    lines(fitNB3$fit$fitted[[4]], col = "pink", lty = 4)
##D    # read out RMSE
##D    fitNB1$fit$RMSE[[1]]
##D    fitNB1$fit$RMSE[[2]]
##D    fitNB1$fit$RMSE[[3]]
##D    fitNB1$fit$RMSE[[4]]
##D    fitNB2$fit$RMSE[[1]]
##D    fitNB2$fit$RMSE[[2]]
##D    fitNB2$fit$RMSE[[3]]
##D    fitNB2$fit$RMSE[[4]]
##D    fitNB3$fit$RMSE[[1]]
##D    fitNB3$fit$RMSE[[2]]
##D    fitNB3$fit$RMSE[[3]]
##D    fitNB3$fit$RMSE[[4]]
##D  
## End(Not run)
 ## Don't show: 
   Nortonbass(tsIbm, startval.met = "2ST", estim.met = "OLS", startval = NULL, flexpq = FALSE, gstart = NULL)
 
## End(Don't show)
  



