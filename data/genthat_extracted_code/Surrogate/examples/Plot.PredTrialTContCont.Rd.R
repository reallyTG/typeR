library(Surrogate)


### Name: plot PredTrialTContCont
### Title: Plots the expected treatment effect on the true endpoint in a
###   new trial (when both S and T are normally distributed continuous
###   endpoints)
### Aliases: 'plot PredTrialTContCont' plot.PredTrialTContCont
### Keywords: New trial Predict treatment effect T

### ** Examples

## Not run: 
##D  # time consuming code part
##D # Generate dataset
##D Sim.Data.MTS(N.Total=2000, N.Trial=15, R.Trial.Target=.95, 
##D R.Indiv.Target=.8, D.aa=10, D.bb=50, 
##D Fixed.Effects=c(1, 2, 30, 90), Seed=1)
##D 
##D # Evaluate surrogacy using a reduced bivariate mixed-effects model
##D BimixedFit <- BimixedContCont(Dataset = Data.Observed.MTS, 
##D Surr = Surr, True = True, Treat = Treat, Trial.ID = Trial.ID, 
##D Pat.ID = Pat.ID, Model="Reduced")
##D 
##D # Suppose that in a new trial, it was estimated alpha_0 = 30
##D # predict beta_0 in this trial
##D Pred_Beta <- Pred.TrialT.ContCont(Object = BimixedFit, 
##D alpha_0 = 30)
##D 
##D # Examine the results
##D summary(Pred_Beta)
##D 
##D # Plot the results
##D plot(Pred_Beta)
## End(Not run)



