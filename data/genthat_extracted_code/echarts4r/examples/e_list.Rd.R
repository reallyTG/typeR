library(echarts4r)


### Name: e_list
### Title: List
### Aliases: e_list

### ** Examples

N <- 20 # data points

opts <- list(
  xAxis = list(
    type = "category",
    data = LETTERS[1:N]
  ),
  yAxis = list(
    type = "value"
  ),
  series = list(
    list(
      type = "line",
      data = round(runif(N, 5, 20))
    )
  )
)

e_charts() %>% 
  e_list(opts)




