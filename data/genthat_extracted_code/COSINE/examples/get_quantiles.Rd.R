library(COSINE)


### Name: get_quantiles
### Title: Get the five quantiles of the weight parameter lambda
### Aliases: get_quantiles

### ** Examples


data(set1_scaled_diff)

klist<-c(20,25)

set1_quantile<-get_quantiles(diff_expr=set1_scaled_diff[[1]],
diff_coex=set1_scaled_diff[[2]],klist,pop_size=20)




