library(padr)


### Name: fill_by_function
### Title: Fill missing values by a function of the nonmissings
### Aliases: fill_by_function

### ** Examples

library(dplyr) # for the pipe operator
x <- seq(as.Date('2016-01-01'), by = 'day', length.out = 366)
x <- x[sample(1:366, 200)] %>% sort
x_df <- data_frame(x  = x,
                   y1 = runif(200, 10, 20) %>% round,
                   y2 = runif(200, 1, 50) %>% round)
x_df %>% pad %>% fill_by_function(y1, y2)
x_df %>% pad %>% fill_by_function(y1, y2, fun = median)



