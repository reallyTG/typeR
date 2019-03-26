library(expss)


### Name: w_mean
### Title: Compute various weighted statistics
### Aliases: w_mean w_median w_var w_sd w_se w_mad w_sum w_n
###   unweighted_valid_n valid_n w_max w_min w_cov w_cor w_pearson
###   w_spearman

### ** Examples

data(mtcars)
dfs = mtcars %>% keep(mpg, disp, hp, wt)

with(dfs, w_mean(hp, weight = 1/wt))

# apply labels
dfs = modify(dfs, {
         var_lab(mpg) = "Miles/(US) gallon"
         var_lab(disp) = "Displacement (cu.in.)"
         var_lab(hp) = "Gross horsepower"
         var_lab(wt) = "Weight (1000 lbs)"
})

# weighted correlations with labels
w_cor(dfs, weight = 1/dfs$wt)

# without labels
w_cor(unvr(dfs), weight = 1/dfs$wt)



