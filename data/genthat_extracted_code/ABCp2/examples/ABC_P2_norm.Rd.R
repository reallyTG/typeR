library(ABCp2)


### Name: ABC_P2_norm
### Title: ABC Extimation of P2 for Normal Distribution
### Aliases: ABC_P2_norm
### Keywords: ~kwd1 ~kwd2

### ** Examples

#Fit the Mean and Standard Deviation hyperpriors to a distribution of offspring. 

data(fungus)
fit_dist_norm(fungus$Total_Offspring)

#Use hyperiors and priors calculated from the data to estimate P2. 
#Plot the saved distributions for the Mean and Standard Deviation parameters.
#Adjust, if necessary.

fungus_P2<-ABC_P2_norm(12, 9.9, 11.35, 17.31, 8.22, 12.44, 0.1, 100)
hist(fungus_P2$posterior)
hist(fungus_P2$Avg)
hist(fungus_P2$Std)




