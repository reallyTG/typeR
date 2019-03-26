library(rbokeh)


### Name: flightfreq
### Title: Flight frequency dataset
### Aliases: flightfreq
### Keywords: data

### ** Examples

## No test: 
p <- figure(width = 1000) %>%
  ly_points(date, Freq, data = flightfreq,
    hover = list(date, Freq, dow), size = 5) %>%
  ly_abline(v = as.Date("2001-09-11"))
p
## End(No test)



