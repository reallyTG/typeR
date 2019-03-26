library(ABCp2)


### Name: fit_dist_norm
### Title: Fit Offspring Distribution to the Normal Distribution
### Aliases: fit_dist_norm
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Fit the Mean and Standard Deviation parameters to a distribution of offspring.
#Test the goodness of fit.

data(fungus)
fungus_fit<-fit_dist_norm(fungus$Total_Offspring)
fungus_fit$fit_norm
fungus_fit$chi_norm
fungus_fit$data_norm



