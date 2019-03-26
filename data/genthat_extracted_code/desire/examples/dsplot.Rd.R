library(desire)


### Name: dsplot
### Title: Desirability Plot
### Aliases: dsplot
### Keywords: hplot

### ** Examples

d1 <- harrington2(2, 4, 2)
dsplot(x*log(x), d1,
       from=0, to=6, n=507,
       interest=c(2, 3, 4))



