library(FLAME)


### Name: CATE_plot
### Title: Summarize CATEs of All Matched Groups by Boxplot
### Aliases: CATE_plot

### ** Examples

data(toy_data)
result <- FLAME::FLAME_bit(data = toy_data, holdout = toy_data)
CATE_object <- FLAME::CATE(FLAME_object = result, cov_name = c("X1", "X2"), cov_val = c("2", "2"))
FLAME::CATE_plot(CATE_object)



