library(CCMnet)


### Name: CCMnet_constr
### Title: Congruence Class Model for Networks
### Aliases: CCMnet_constr

### ** Examples

set.seed(1)
#
#Example: Density (Normal)
#
CCMnet_Result = CCMnet_constr(Network_stats= c('Density'), 
                              Prob_Distr=c('Normal'), 
                              Prob_Distr_Params=list(list(.04, .0001)), 
                              samplesize = 5000, 
                              burnin=1000, 
                              interval=100,
                              statsonly=TRUE, 
                              P=NULL,
                              population=100, 
                              covPattern = NULL, 
                              remove_var_last_entry = FALSE) 
statsmatrix = CCMnet_Result[[1]]
G_list = CCMnet_Result[[2]]

#Mean Network Density (Simulated Networks)
mean(statsmatrix) 
#Variance of Network Density (Simulated Networks)
var(statsmatrix)

## Not run: 
##D #
##D #Example: Degree Distribution (Dirichlet-multinomial)
##D #
##D CCMnet_Result = CCMnet_constr(Network_stats='DegreeDist',
##D                               Prob_Distr='DirMult',
##D                               Prob_Distr_Params=list(list(c(2,21,15,12))), 
##D                               samplesize = 10000,
##D                               burnin=100000, 
##D                               interval=1000,
##D                               statsonly=TRUE, 
##D                               P=NULL,
##D                               population=500, 
##D                               covPattern = NULL,
##D                               remove_var_last_entry = FALSE) 
##D statsmatrix = CCMnet_Result[[1]]
##D G_list = CCMnet_Result[[2]]
##D 
##D #Mean Degree Distribution (Simulated Networks)
##D apply(statsmatrix, 2, mean)
##D #Variance of Degree Distribution (Simulated Networks)
##D apply(statsmatrix, 2, var)  
##D 
##D #
##D #Example: Degree Distribution (Normal)
##D #
##D Prob_Distr_Params=list(NS_Multinomial(G_list[[1]],
##D                                      Network_stats = 'DegreeDist',
##D                                      mean_inflate = .05, 
##D                                      var_inflate = 1.05))
##D 
##D CCMnet_Result = CCMnet_constr(Network_stats='DegreeDist',
##D                               Prob_Distr='Normal',
##D                               Prob_Distr_Params=Prob_Distr_Params, 
##D                               samplesize = 50000,
##D                               burnin=100000, 
##D                               interval=1000,
##D                               statsonly=TRUE, 
##D                               P=NULL,
##D                               population=500, 
##D                               covPattern = NULL,
##D                               remove_var_last_entry = FALSE) 
##D statsmatrix = CCMnet_Result[[1]]
##D G_list = CCMnet_Result[[2]]
##D 
##D #Mean Degree Distribution (Simulated Networks)
##D apply(statsmatrix, 2, mean)
##D #Variance of Degree Distribution (Simulated Networks)
##D apply(statsmatrix, 2, var)
##D 
##D #
##D #Example: Degree Mixing (Normal)
##D #
##D Prob_Distr_Params=list(NS_Multinomial(G_list[[1]],
##D                                      Network_stats = 'DegMixing',
##D                                      mean_inflate = .05, 
##D                                      var_inflate = 1.05))
##D 
##D CCMnet_Result = CCMnet_constr(Network_stats='DegMixing',
##D                               Prob_Distr='Normal',
##D                               Prob_Distr_Params=Prob_Distr_Params, 
##D                               samplesize = 50000,
##D                               burnin=100000, 
##D                               interval=1000,
##D                               statsonly=TRUE, 
##D                               P=NULL,
##D                               population=500, 
##D                               covPattern = NULL,
##D                               remove_var_last_entry = FALSE) 
##D statsmatrix = CCMnet_Result[[1]]
##D G = CCMnet_Result[[2]]
##D 
##D #Mean Degree Mixing (Simulated Networks)
##D apply(statsmatrix, 2, mean)
##D #Variance of Degree Mixing (Simulated Networks)
##D apply(statsmatrix, 2, var) 
##D 
##D                    
##D #
##D #Example: Degree Mixing and Triangles (Normal, Normal)
##D #
##D Prob_Distr_Params=list(NS_Multinomial(G_list[[1]],
##D                                      Network_stats = 'DegMixing',
##D                                      mean_inflate = .05, 
##D                                      var_inflate = 1.05), 
##D                        list(6,2)) 
##D 
##D CCMnet_Result = CCMnet_constr(Network_stats=c('DegMixing', 'Triangles'),
##D                               Prob_Distr=c('Normal', 'Normal'),
##D                               Prob_Distr_Params=Prob_Distr_Params, 
##D                               samplesize = 50000,
##D                               burnin=100000, 
##D                               interval=1000,
##D                               statsonly=TRUE, 
##D                               P=NULL,
##D                               population=500, 
##D                               covPattern = NULL,
##D                               remove_var_last_entry = FALSE) 
##D statsmatrix = CCMnet_Result[[1]]
##D G = CCMnet_Result[[2]]
##D 
##D #Mean Degree Mixing and Number of Triangles (Simulated Networks)
##D apply(statsmatrix, 2, mean)
##D #Variance of Degree Mixing and Number of Triangles (Simulated Networks)
##D apply(statsmatrix, 2, var)  
## End(Not run)



