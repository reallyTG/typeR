library(c3)


### Name: subchart
### Title: Add Subchart
### Aliases: subchart subchart.c3

### ** Examples

data.frame(a = abs(rnorm(20) * 10),
           b = abs(rnorm(20) * 10),
           date = seq(as.Date("2014-01-01"), by = "month", length.out = 20)) %>%
     c3(x = 'date') %>%
     subchart(height = 20, onbrush = 'function (domain) { console.log(domain) }')




