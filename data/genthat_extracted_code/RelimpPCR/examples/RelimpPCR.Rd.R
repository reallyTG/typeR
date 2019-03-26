library(RelimpPCR)


### Name: RelimpPCR
### Title: A Relative Importance PCA Regression Function
### Aliases: RelimpPCR

### ** Examples

## No test: 
#Below performs single core relative importance principal 
#components regression of mpg against cyl, disp, and hp (all from the mtcars 
#sample data set), optimizing for a r-squared value of 0.75.
y = mtcars$mpg[1:20]; x = mtcars[1:20,c("cyl","disp")]
pcr_object = RelimpPCR(Y = y, X = x,target_r2 = 0.75, multicore = FALSE,
remove_factors = FALSE, normalize_data = FALSE, plot_this = FALSE)
## End(No test)



