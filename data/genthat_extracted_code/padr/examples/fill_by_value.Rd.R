library(padr)


### Name: fill_by_value
### Title: Fill missing values by a single value
### Aliases: fill_by_value

### ** Examples

library(dplyr) # for the pipe operator
x <- seq(as.Date('2016-01-01'), by = 'day', length.out = 366)
x <- x[sample(1:366, 200)] %>% sort
x_df <- data_frame(x  = x,
                   y1 = runif(200, 10, 20) %>% round,
                   y2 = runif(200, 1, 50) %>% round,
                   y3 = runif(200, 20, 40) %>% round,
                   y4 = sample(letters[1:5], 200, replace = TRUE))
x_padded <- x_df %>% pad
x_padded %>% fill_by_value(y1)
x_df %>% pad %>% fill_by_value(y1, y2, value = 42)



