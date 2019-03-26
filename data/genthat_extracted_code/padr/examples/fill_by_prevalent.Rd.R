library(padr)


### Name: fill_by_prevalent
### Title: Fill missing values by the most prevalent nonmissing value
### Aliases: fill_by_prevalent

### ** Examples

library(dplyr) # for the pipe operator
x <- seq(as.Date('2016-01-01'), by = 'day', length.out = 366)
x <- x[sample(1:366, 200)] %>% sort
x_df <- data_frame(x  = x,
                  y1 = rep(letters[1:3], c(80, 70, 50)) %>% sample,
                  y2 = rep(letters[2:5], c(60, 80, 40, 20)) %>% sample)
x_df %>% pad %>% fill_by_prevalent(y1, y2)



