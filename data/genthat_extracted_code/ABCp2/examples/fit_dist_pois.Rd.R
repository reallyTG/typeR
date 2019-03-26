library(ABCp2)


### Name: fit_dist_pois
### Title: Fit Offspring Distribution to the Poisson Distribution
### Aliases: fit_dist_pois
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Fit the Lambda parameter to a distribution of offspring.
#Test the goodness of fit.

data(fungus)
fungus_fit<-fit_dist_pois(fungus$Total_Offspring)
fungus_fit$fit_pois
fungus_fit$chi_pois
hist(fungus_fit$data_pois)



