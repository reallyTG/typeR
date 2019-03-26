library(COSINE)


### Name: choose_lambda
### Title: Choose the most appropriate weight parameter lambda
### Aliases: choose_lambda

### ** Examples


data(set1_scaled_diff)
data(set1_GA)

set1_quantile<-get_quantiles(diff_expr=set1_scaled_diff[[1]],
diff_coex=set1_scaled_diff[[2]],klist=c(20,25),pop_size=5)

lambda<-set1_quantile[[2]]

set1_choose_lambda <- choose_lambda(diff_expr=set1_scaled_diff[[1]],
diff_coex=set1_scaled_diff[[2]],lambda,subnet_size=set1_GA$Subnet_size,
num_random_sampling=2,best_score=set1_GA$Best_Scores)




