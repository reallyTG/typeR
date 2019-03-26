library(Hmisc)


### Name: hist.data.frame
### Title: Histograms for Variables in a Data Frame
### Aliases: hist.data.frame
### Keywords: hplot dplot distribution

### ** Examples

d <- data.frame(a=runif(200), b=rnorm(200),
                w=factor(sample(c('green','red','blue'), 200, TRUE)))
hist.data.frame(d)   # in R, just say hist(d)



