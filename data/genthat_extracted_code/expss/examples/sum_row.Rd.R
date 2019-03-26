library(expss)


### Name: sum_row
### Title: Compute sum/mean/sd/median/max/min/custom function on
###   rows/columns
### Aliases: sum_row sum_col mean_row mean_col sd_row sd_col median_row
###   median_col max_row max_col min_row min_col apply_row apply_col
###   any_in_row any_in_col all_in_row all_in_col

### ** Examples

## Inside example
iris = modify(iris,{
  new_median = median_row(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
  new_mean = mean_row(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width)
  })
  
dfs = data.frame(
    test = 1:5,
    aa = rep(10, 5),
    b_ = rep(20, 5),
    b_1 = rep(11, 5),
    b_2 = rep(12, 5),
    b_4 = rep(14, 5),
    b_5 = rep(15, 5) 
)

# calculate sum of b* variables
modify(dfs, {
    b_total = sum_row(b_, b_1 %to% b_5)
})

# conditional modification
modify_if(dfs, test %in% 2:4, {
    b_total = sum_row(b_, b_1 %to% b_5)
})

# Examples from rowSums/colSums manual.
## Compute row and column sums for a matrix:
x = cbind(x1 = 3, x2 = c(4:1, 2:5))
sum_row(x); sum_col(x)
dimnames(x)[[1]] <- letters[1:8]
sum_row(x); sum_col(x); mean_row(x); mean_col(x)




