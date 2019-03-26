library(ggvis)


### Name: compute_boxplot
### Title: Calculate boxplot values
### Aliases: compute_boxplot

### ** Examples

mtcars %>% compute_boxplot(~mpg)
mtcars %>% group_by(cyl) %>% compute_boxplot(~mpg)



