library(agricolae)


### Name: friedman
### Title: Friedman test and multiple comparison of treatments
### Aliases: friedman
### Keywords: nonparametric

### ** Examples

library(agricolae)
data(grass)
out<-with(grass,friedman(judge,trt, evaluation,alpha=0.05, group=TRUE,console=TRUE,
main="Data of the book of Conover"))
#startgraph
plot(out,variation="IQR")
#endgraph



