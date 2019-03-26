library(extracat)


### Name: cutbw
### Title: Active binning
### Aliases: cutbw

### ** Examples

y<-cutbw(c(rnorm(200),rnorm(100,mean=8)),k = 30, min_n = 1)
barplot(table(y))



