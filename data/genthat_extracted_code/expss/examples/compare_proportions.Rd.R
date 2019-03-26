library(expss)


### Name: compare_proportions
### Title: Calculate significance (p-values) of differences between
###   proportions/means
### Aliases: compare_proportions compare_means

### ** Examples

# proportions
data(mtcars)
counts = table(mtcars$am, mtcars$vs)
props = prop.table(counts)
compare_proportions(props[,1], props[,2], 
                    colSums(counts)[1], colSums(counts)[1])
                    
# means
t.test(mpg ~ am, data = mtcars)$p.value 
# the same result
calculate(mtcars, 
          compare_means(
              mean(mpg[am==0]), mean(mpg[am==1]), 
              sd(mpg[am==0]),  sd(mpg[am==1]),
              length(mpg[am==0]), length(mpg[am==1])
          ))



