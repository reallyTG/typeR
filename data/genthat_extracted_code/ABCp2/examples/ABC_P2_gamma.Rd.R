library(ABCp2)


### Name: ABC_P2_gamma
### Title: ABC Estimation of P2 for Gamma Distribution
### Aliases: ABC_P2_gamma
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Fit the Shape and Rate hyperpriors to a distribution of offspring. 

data(fungus)
fit_dist_gamma(fungus$Total_Offspring)

#Use hyperiors and priors calculated from the data to estimate P2. 
#Plot the saved distributions for the Shape and Rate parameters.
#Adjust, if necessary.

fungus_P2<-ABC_P2_gamma(12, 9.9, 1.14, 2.52, 0.06, 0.18, 0.1, 100)
hist(fungus_P2$posterior)
hist(fungus_P2$Shape)
hist(fungus_P2$Rate)




