library(ANOVAreplication)


### Name: power.calc
### Title: Power Calculator
### Aliases: power.calc
### Keywords: htest

### ** Examples

#analysis original data
data_o <- data.frame(y=ChickWeight$weight,g=ChickWeight$Diet)
g.m <- mean(data_o$y)
#compute pooled sd
sd.g <- aggregate(data_o$y,by=list(data_o$g),sd)[,2]
n.g <- table(data_o$g)
p.sd <- ((n.g[1]-1)*sd.g[1]+(n.g[2]-1)*sd.g[2]+(n.g[3]-1)*sd.g[3]+(n.g[4]-1)*sd.g[4])/(sum(n.g)-4)

means <- aggregate(data_o$y,by=list(data_o$g),mean)[,2]

Gibbs.ANOVA(data_o,it=200,burnin=50) #we advise >1000 iterations, >500 burnin for reliable results

power.calc(n.r=c(20,21,22,23),posterior=output_m,g.m=g.m,p.sd=p.sd,
           statistic="exact",exact=means,alpha=.05)




