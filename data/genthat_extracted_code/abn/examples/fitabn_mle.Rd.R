library(abn)


### Name: fitabn.mle
### Title: Fit an additive Bayesian network model based on maximum
###   likelihood estimation.
### Aliases: fitabn.mle
### Keywords: models

### ** Examples

## use built-in simulated data set

mydat <- ex0.dag.data[,c("b1","b2","b3","g1","b4","p2","p4")];## take a subset of cols

## setup distribution list for each node
mydists <- list(b1="binomial",
              b2="binomial",
              b3="binomial",
              g1="gaussian",
              b4="binomial",
              p2="poisson",
              p4="poisson"
             );
## null model - all independent variables
mydag.empty<-matrix(data=c(
                     0,0,0,0,0,0,0, # 
                     0,0,0,0,0,0,0, #
                     0,0,0,0,0,0,0, # 
                     0,0,0,0,0,0,0, # 
                     0,0,0,0,0,0,0, #
                     0,0,0,0,0,0,0, #
                     0,0,0,0,0,0,0  #
                     ), byrow=TRUE,ncol=7);
colnames(mydag.empty)<-rownames(mydag.empty)<-names(mydat);
## now repeat but include some dependencies
mydag<-mydag.empty;
mydag["b1","b2"]<-1; # b1<-b2 
mydag["b2","p4"]<-1; # b2<-p4
mydag["b2","g1"]<-1; # b2<-g1
mydag["g1","p2"]<-1; # g1<-p2
mydag["b3","g1"]<-1; # b3<-g1
mydag["b4","b1"]<-1; # b4<-b1
mydag["p4","g1"]<-1; # p4<-g1

## now fit the model to calculate its goodness of fit
myres.c <- fitabn.mle(dag.m=mydag,data.df=mydat,data.dists=mydists,centre=TRUE);

print(myres.c$mlik);

plotabn(dag.m = mydag,data.dists = mydists,fitted.values.abn.mle = myres.c$modes)



