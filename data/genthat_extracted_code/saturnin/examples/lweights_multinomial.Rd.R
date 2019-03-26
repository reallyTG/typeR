library(saturnin)


### Name: lweights_multinomial
### Title: Computation of the log-weight matrix in a multinomial setting.
### Aliases: lweights_multinomial
### Keywords: multinomial

### ** Examples

library('saturnin')
data(data_multinomial)

W <- lweights_multinomial(data_multinomial)

prob <- edge.prob(W, log = TRUE)



