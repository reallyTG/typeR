library(JoSAE)


### Name: JoSAE-package
### Title: Provides functions for some small area estimators and their mean
###   squared errors.
### Aliases: JoSAE-package JoSAE
### Keywords: package

### ** Examples

	#mean auxiliary variables for the populations in the domains
data(JoSAE.domain.data)
	#data for the sampled elements
data(JoSAE.sample.data)
plot(biomass.ha~mean.canopy.ht,JoSAE.sample.data)

## use the original wrapper function

    #lme model
summary(fit.lme <- lme(biomass.ha ~ mean.canopy.ht, data=JoSAE.sample.data
                       , random=~1|domain.ID))

    #domain data need to have the same column names as sample data or vice versa
d.data <- JoSAE.domain.data
names(d.data)[3] <- "mean.canopy.ht"

result <- eblup.mse.f.wrap(domain.data = d.data, lme.obj = fit.lme)
result

##END: use the original wrapper function


## the same with a newer function that can consider heteroskedasticity
res <-
    sae.ul.f(samp.data=JoSAE.sample.data,
             population.data=d.data,
				#assuming homoskedasticity
             k.ij=rep(1, nrow(JoSAE.sample.data)),
             formula=biomass.ha ~ mean.canopy.ht,
             domain.col="domain.ID",
             sample.id.col="sample.ID",
             neg.sfrac=TRUE)
res$est$est

##END: the same with a newer function that can consider heteroskedasticity




