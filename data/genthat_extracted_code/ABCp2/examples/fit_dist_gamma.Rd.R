library(ABCp2)


### Name: fit_dist_gamma
### Title: Fit Offspring Distribution to the Gamma Distribution
### Aliases: fit_dist_gamma
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Fit the Shape and Rate parameters to a distribution of offspring.
#Test the goodness of fit.

data(fungus)
fungus_fit<-fit_dist_gamma(fungus$Total_Offspring)
fungus_fit$fit_gamma
fungus_fit$chi_gamma
hist(fungus_fit$data_gamma)



