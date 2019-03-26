library(inlabru)


### Name: Poisson1_1D
### Title: 1-Dimensional Homogeneous Poisson example.
### Aliases: Poisson1_1D lambda1_1D E_nc1 pts1 countdata1

### ** Examples

## No test: 
library(ggplot2)
data(Poisson1_1D)
ggplot(countdata1) + 
geom_point(data = countdata1, aes(x=x,y=count),col="blue") +ylim(0,max(countdata1$count)) +
  geom_point(data = pts1, aes(x=x), y = 0.2, shape = "|",cex=4) +
  geom_point(data = countdata1, aes(x=x), y = 0, shape = "+",col="blue",cex=4) +
  xlab(expression(bold(s))) +ylab("count")
## End(No test)



