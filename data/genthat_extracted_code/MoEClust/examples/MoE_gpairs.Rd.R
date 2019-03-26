library(MoEClust)


### Name: MoE_gpairs
### Title: Generalised Pairs Plots for MoEClust Mixture Models
### Aliases: MoE_gpairs
### Keywords: plotting

### ** Examples

## Not run: 
##D data(ais)
##D res   <- MoE_clust(ais[,3:7], G=2, gating= ~ BMI, expert= ~ sex,
##D                    network.data=ais, modelNames="EVE")
##D MoE_gpairs(res)
##D 
##D # Produce the same plot, but with a violin plot in the lower triangle.
##D # Add fitted lines to the scatter plots. Don't show the "sex" covariate.
##D # Size points in the response vs. response panels by their clustering uncertainty.
##D MoE_gpairs(res, conditional=c("stripplot", "violin"), cov.ind=1,
##D            scatter.type=c("lm2", "points"), response.type="uncertainty")
##D 
##D # Instead show the bivariate density contours of the reponse variables.
##D # (Plotting may be slow when response.type="density" for models with expert covariates.)
##D # Use different colours for histograms of covariates in the gating/expert/both networks.
##D # Also use different colours for response vs. covariate & covariate vs. response panels.
##D MoE_gpairs(res, response.type="density", show.labels=FALSE,
##D            hist.color=c("black", "cyan", "hotpink", "chartreuse"),
##D            bg.col=c("whitesmoke", "white", "mintcream", "mintcream", "floralwhite"))
## End(Not run)



