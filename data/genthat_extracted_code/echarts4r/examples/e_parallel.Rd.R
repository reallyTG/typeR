library(echarts4r)


### Name: e_parallel
### Title: Parallel
### Aliases: e_parallel e_parallel_

### ** Examples

df <- data.frame(
  price = rnorm(5, 10),
  amount = rnorm(5, 15),
  letter = LETTERS[1:5]
)

df %>% 
  e_charts() %>% 
  e_parallel(price, amount, letter) 
  



