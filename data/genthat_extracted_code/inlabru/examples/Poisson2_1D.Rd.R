library(inlabru)


### Name: Poisson2_1D
### Title: 1-Dimensional NonHomogeneous Poisson example.
### Aliases: Poisson2_1D lambda2_1D cov2_1D E_nc2 pts2 countdata2

### ** Examples

## No test: 
library(ggplot2)
data(Poisson2_1D)
p1 = ggplot(countdata2) + 
geom_point(data = countdata2, aes(x=x,y=count),col="blue") +ylim(0,max(countdata2$count,E_nc2)) +
  geom_point(data = countdata2, aes(x=x), y = 0, shape = "+",col="blue",cex=4) +
  geom_point(data=data.frame(x=countdata2$x,y=E_nc2), aes(x=x), y = E_nc2, shape = "_",cex=5) +
  xlab(expression(bold(s))) +ylab("count")
ss = seq(0,55,length=200)
lambda = lambda2_1D(ss)
p2 = ggplot() + 
  geom_line(data=data.frame(x=ss,y=lambda), aes(x=x,y=y),col="blue") +ylim(0,max(lambda)) +
  geom_point(data = pts2, aes(x=x), y = 0.2, shape = "|",cex=4) +
  xlab(expression(bold(s))) +ylab(expression(lambda(bold(s))))
multiplot(p1,p2,cols=1)
## End(No test)



