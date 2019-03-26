library(ANOVAreplication)


### Name: sample.size.calc
### Title: Sample size calculator for the prior.predictive.check function
### Aliases: sample.size.calc
### Keywords: htest

### ** Examples

#analysis original data
data_o <- data.frame(y=ChickWeight$weight,g=ChickWeight$Diet)
#compute pooled sd
sd.g <- aggregate(data_o$y,by=list(data_o$g),sd)[,2]
n.g <- table(data_o$g)
p.sd <- ((n.g[1]-1)*sd.g[1]+(n.g[2]-1)*sd.g[2]+(n.g[3]-1)*sd.g[3]+(n.g[4]-1)*sd.g[4])/(sum(n.g)-4)

Gibbs.ANOVA(data_o,it=75,burnin=50) #we advise >1000 iterations, >500 burnin for reliable results
Amat <- (rbind(c(-1,0,0,1),c(0,-1,0,1),c(0,0,1,-1)))
difmin=c(0.8,0.5,0.2)

#sample size calculator
sample.size.calc(start_n=60, powtarget=.825,powmargin=.025,posterior=output_m,
                 g.m=mean(data_o$y),p.sd=p.sd,
                 statistic="dif",effectsize=TRUE,Amat=Amat,difmin=difmin)



