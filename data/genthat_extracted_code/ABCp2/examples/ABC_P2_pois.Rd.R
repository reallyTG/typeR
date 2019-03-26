library(ABCp2)


### Name: ABC_P2_pois
### Title: ABC Estimation of P2 for Poisson Distribution
### Aliases: ABC_P2_pois
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Fit the Lambda hyperprior to a distribution of offspring.

data(fungus)
fit_dist_pois(fungus$Total_Offspring)

#Use hyperiors and priors calculated from the data to estimate P2. 
#Plot the saved distributions for the Lambda parameter. 
#Adjust, if necessary.

fungus_P2<-ABC_P2_pois(12, 9.9, 13.24, 15.42, 0.1, 100)
hist(fungus_P2$posterior)
hist(fungus_P2$Lambda)




