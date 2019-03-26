library(CCMnet)


### Name: NS_Multinomial
### Title: Calculate network statistic and covariance matrix.
### Aliases: NS_Multinomial

### ** Examples

g = as.network(rgraph(n=500, m=1, tprob=.01, 
		           mode='graph', diag=FALSE,
                     replace=FALSE, tielist=NULL, 
                     return.as.edgelist=FALSE),
               directed = FALSE)

Prob_Distr_Params=list(NS_Multinomial(g,
				  Network_stats = 'DegreeDist',
                       mean_inflate = .05, 
                       var_inflate = 1.05))

Prob_Distr_Params=list(NS_Multinomial(g,
                       Network_stats = 'DegMixing',
                       mean_inflate = .05, 
                       var_inflate = 1.05))



