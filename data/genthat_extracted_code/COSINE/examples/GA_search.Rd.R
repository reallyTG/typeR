library(COSINE)


### Name: GA_search
### Title: Use genetic algorithm to search for the globally optimal
###   subnetwork
### Aliases: GA_search

### ** Examples


# Load the scaled F-statistics and ECF-statistics 
# for the simulated datasets

data(set1_scaled_diff)

# Get the quantiles of lambda

klist<-c(25,30)
set1_quantile<-get_quantiles(diff_expr=set1_scaled_diff[[1]], 
diff_coex=set1_scaled_diff[[2]],klist,pop_size=10)
lambda<-set1_quantile[[2]]

#Perform genetic algorithm to search-just show the first iteration here

set1_GA<-GA_search(lambda[1:2],diff_expr=set1_scaled_diff[[1]],
diff_coex=set1_scaled_diff[[2]], num_iter=1, muCh=0.05, zToR=50)




