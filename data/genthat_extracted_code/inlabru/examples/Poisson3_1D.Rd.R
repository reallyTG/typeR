library(inlabru)


### Name: Poisson3_1D
### Title: 1-Dimensional NonHomogeneous Poisson example.
### Aliases: Poisson3_1D lambda3_1D E_nc3a E_nc3b pts3 countdata3a
###   countdata3b

### ** Examples

## No test: 
library(ggplot2)
data(Poisson3_1D)
# first the plots for the 10-bin case:
p1a = ggplot(countdata3a) + 
geom_point(data = countdata3a, aes(x=x,y=count),col="blue") +ylim(0,max(countdata3a$count,E_nc3a)) +
  geom_point(data = countdata3a, aes(x=x), y = 0, shape = "+",col="blue",cex=4) +
  geom_point(data=data.frame(x=countdata3a$x,y=E_nc3a), aes(x=x), y = E_nc3a, shape = "_",cex=5) +
  xlab(expression(bold(s))) +ylab("count")
ss = seq(0,55,length=200)
lambda = lambda3_1D(ss)
p2a = ggplot() + 
  geom_line(data=data.frame(x=ss,y=lambda), aes(x=x,y=y),col="blue") +ylim(0,max(lambda)) +
  geom_point(data = pts3, aes(x=x), y = 0.2, shape = "|",cex=4) +
  xlab(expression(bold(s))) +ylab(expression(lambda(bold(s))))
multiplot(p1a,p2a,cols=1)

# Then the plots for the 20-bin case:
p1a = ggplot(countdata3b) + 
  geom_point(data = countdata3b, aes(x=x,y=count),col="blue") +
  ylim(0,max(countdata3b$count,E_nc3b)) +
  geom_point(data = countdata3b, aes(x=x), y = 0, shape = "+",col="blue",cex=4) +
  geom_point(data=data.frame(x=countdata3b$x,y=E_nc3b), aes(x=x), y = E_nc3b, shape = "_",cex=5) +
  xlab(expression(bold(s))) +ylab("count")
ss = seq(0,55,length=200)
lambda = lambda3_1D(ss)
p2a = ggplot() + 
  geom_line(data=data.frame(x=ss,y=lambda), aes(x=x,y=y),col="blue") +ylim(0,max(lambda)) +
  geom_point(data = pts3, aes(x=x), y = 0.2, shape = "|",cex=4) +
  xlab(expression(bold(s))) +ylab(expression(lambda(bold(s))))
multiplot(p1a,p2a,cols=1)
## End(No test)



