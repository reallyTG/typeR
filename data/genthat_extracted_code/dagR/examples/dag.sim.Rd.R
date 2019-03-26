library(dagR)


### Name: dag.sim
### Title: Simulate data based on a DAG.
### Aliases: dag.sim

### ** Examples

dag1<-dag.init(covs=c(1), arcs=c(1,0, 1,-1), symbols=c("x","c","y"));
dag.draw(dag1, numbering=TRUE);
# manual recalculation
sim1<-dag.sim(dag1, b=c(0.5, 0.3), stdev=c(1,1,1), seed=1, n=3, verbose=TRUE);
set.seed(1);
cc<-rnorm(3);cc;
noise1<-rnorm(3);noise1;
xx<-(0.5*cc-mean(0.5*cc))+noise1;xx;
noise2<-rnorm(3);noise2;
yy<-(0.3*cc-mean(0.3*cc))+noise2;yy;
# larger dataset
sim1<-dag.sim(dag1, b=c(0.4, 0.2), stdev=c(0,1,0), seed=1, n=10000); 
sapply(sim1, mean);sapply(sim1, sd);
coef(lm(x~c, data=sim1));
coef(lm(y~c, data=sim1));
coef(lm(y~x, data=sim1));
sim1<-dag.sim(dag1, b=c(0.3, 0.6), stdev=c(0,1,0), seed=1, n=10000); 
sapply(sim1, mean);sapply(sim1, sd);
coef(lm(x~c, data=sim1));
coef(lm(y~c, data=sim1));
coef(lm(y~x, data=sim1));

# larger DAG and a binary node;
dag4<-demo.dag4();
dag4$symbols<-c("x","c1","c2","c3","y")
dag.draw(dag4, numbering=TRUE);
sim4<-dag.sim(dag4, b=c(1, 2, 3, log(4), 5), mu=c(10, 20, 30, 0.4, 50), stdev=c(1,2,3,0,5),
                     binary=c(0,0,0,1,0), seed=4, n=1000);
summary(sim4);
coef(lm(c1~x, data=sim4));
coef(lm(c2~x, data=sim4));
coef(lm(c2~c1, data=sim4));
exp(coef(glm(c3~c1, data=sim4, family=binomial(link=logit))));
coef(lm(y~c3, data=sim4));
summary(lm(y~x, data=sim4));
# manual recheck
logit<-function(p) log(p/(1-p));            # helper function;
inv.logit<-function(l) exp(l)/(1+exp(l));   # helper function;
sim4<-dag.sim(dag4, b=c(1, 2, 3, log(4), 5), mu=c(10, 20, 30, 0.4, 50), stdev=c(1,2,3,0,5),
                     binary=c(0,0,0,1,0), seed=4, n=5, verbose=TRUE);
set.seed(4);
xx<-rnorm(m=10, sd=1, n=5); xx;
c1.noise<-rnorm(sd=2, n=5); c1.noise;
c1<- 1*xx - mean(1*xx) + 20 + c1.noise; c1;
c2.noise<-rnorm(sd=3, n=5); c2.noise;
c2<- 2*xx + 3*c1 - mean(2*xx+3*c1) + 30 + c2.noise; c2;
c3.raw<- log(4)*c1 - mean(log(4)*c1) + logit(0.4); c3.raw;
noise.dummy<-rnorm(m=0, sd=0, n=5);
c3<-sapply(c3.raw, FUN=function(x) rbinom(n=1,size=1,p=inv.logit(x))); c3;
yy.noise<-rnorm(sd=5, n=5); yy.noise;
yy<- 0*xx + 5*c3 - mean(5*c3) + 50 + yy.noise; yy;
sim4;
data.frame(xx,c1,c2,c3,yy);



