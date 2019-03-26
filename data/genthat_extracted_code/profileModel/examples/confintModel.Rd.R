library(profileModel)


### Name: confintModel
### Title: Confidence intervals for model parameters
### Aliases: confintModel profSmooth.profileModel profConfint.profileModel
###   profZoom.profileModel profSmooth profConfint profZoom
### Keywords: htest models smooth

### ** Examples

## Not run: 
##D ## Begin Example: quasi likelihood estimation.
##D ## Incidence of leaf-blotch on barley
##D ## McCullagh and Nelder (1989), pp. 328--332
##D library(gnm)
##D data(barley)
##D logitModel <- glm(y ~ site + variety, family = wedderburn, data = barley)
##D profQuasi <- profileModel(logitModel, objective = "ordinaryDeviance",
##D                           quantile=qchisq(0.95, 1),
##D                           which = paste("variety",c(2:9,"X"),sep=""))
##D # very accurate confidence intervals (with endpoints accurate up to 10
##D # decimals) for the variety parameters using profConfint with
##D # method="zoom":
##D c1 <- profConfint(profQuasi, endpoint.tolerance = 1e-10, maxit = 100,
##D                   method="zoom" )
##D # confidence intervals using smoothing:
##D c2 <- profConfint(profQuasi, method="smooth" )
##D # c2 has accurate endpoints at least up to four decimals
##D # this is because of the quadratic shape of the profiles
##D plot(profQuasi, cis = c1)
##D plot(profQuasi, cis = c1, signed = TRUE, print.grid.points = TRUE)
##D # pairs plot
##D pairs(profQuasi)
##D # Notice the direction of the pairs plots. The fact that the
##D # correlations among the estimates are 1/2 is clear.
##D 
##D # profiling using the Rao score statistic
##D # This can be used as deviance in cases were a quasi likelihood does not
##D # exist.
##D profRao <- update(profQuasi, objective = "RaoScoreStatistic",
##D                   X = model.matrix(logitModel))
##D ## End Example
## End(Not run)



