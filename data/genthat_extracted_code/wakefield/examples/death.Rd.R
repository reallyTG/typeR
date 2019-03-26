library(wakefield)


### Name: death
### Title: Generate Random Vector of Deaths Outcomes
### Aliases: death died
### Keywords: death died

### ** Examples

death(10)
died(10)
100*table(death(n <- 10000))/n
100*table(death(n <- 10000, prob = c(.3, .7)))/n
r_data_frame(10, died)



