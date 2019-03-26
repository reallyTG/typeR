library(dave)


### Name: fitmarkov
### Title: Approximating a Markov chain
### Aliases: fitmarkov fitmarkov.default plot.fitmarkov rfitmarkov
### Keywords: multivariate models

### ** Examples

# data frame ltim is Lippe's data (see references)
# ltim just contains the time scale of the same
o.fm<- fitmarkov(lveg,ltim$Year)
plot(o.fm)



