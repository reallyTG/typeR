library(abn)


### Name: fitabn
### Title: Fit an additive Bayesian network model
### Aliases: fitabn
### Keywords: models

### ** Examples

## Not run: 
##D ## use built-in simulated data set
##D 
##D mydat<-ex0.dag.data[,c("b1","b2","b3","g1","b4","p2","p4")];## take a subset of cols
##D 
##D ## setup distribution list for each node
##D mydists<-list(b1="binomial",
##D               b2="binomial",
##D               b3="binomial",
##D               g1="gaussian",
##D               b4="binomial",
##D               p2="poisson",
##D               p4="poisson"
##D              );
##D ## null model - all independent variables
##D mydag.empty<-matrix(data=c(
##D                      0,0,0,0,0,0,0, # 
##D                      0,0,0,0,0,0,0, #
##D                      0,0,0,0,0,0,0, # 
##D                      0,0,0,0,0,0,0, # 
##D                      0,0,0,0,0,0,0, #
##D                      0,0,0,0,0,0,0, #
##D                      0,0,0,0,0,0,0  #
##D                      ), byrow=TRUE,ncol=7);
##D colnames(mydag.empty)<-rownames(mydag.empty)<-names(mydat);
##D 
##D ## now fit the model to calculate its goodness of fit
##D myres.c<-fitabn(dag.m=mydag.empty,data.df=mydat,data.dists=mydists,centre=TRUE,
##D                 compute.fixed=FALSE);
##D 
##D print(myres.c$mlik);## log marginal likelihood goodness of fit for complete DAG
##D 
##D ## now repeat but include some dependencies
##D mydag<-mydag.empty;
##D mydag["b1","b2"]<-1; # b1<-b2 
##D mydag["b2","p4"]<-1; # b2<-p4
##D mydag["b2","g1"]<-1; # b2<-g1
##D mydag["g1","p2"]<-1; # g1<-p2
##D mydag["b3","g1"]<-1; # b3<-g1
##D mydag["b4","b1"]<-1; # b4<-b1
##D mydag["p4","g1"]<-1; # p4<-g1
##D 
##D myres.c<-fitabn(dag.m=mydag,data.df=mydat,data.dists=mydists,centre=TRUE,
##D                 compute.fixed=FALSE);
##D 
##D print(myres.c$mlik);## a much poorer fit than full independence DAG
##D 
##D ## now also plot the graph via graphviz 
##D myres.c<-fitabn(dag.m=mydag,data.df=mydat,data.dists=mydists,centre=TRUE,
##D                 create.graph=TRUE,compute.fixed=FALSE);
##D 
##D plotabn(dag.m = mydag,data.dists = mydists,fitted.values.abn = myres.c$modes)
##D 
##D ## a simple plot of some posterior densities
##D ## the algorithm which chooses density points is very simple any may be
##D ## rather sparse so also recompute the density over an equally spaced
##D ## grid of 100 points between the two end points
##D ## which had at f=min.pdf
##D myres.c<-fitabn(dag.m=mydag,data.df=mydat,data.dists=mydists,centre=TRUE,
##D                 compute.fixed=TRUE,n.grid=100);
##D 
##D ## repeat but use INLA for the numerics using max.mode.error=100
##D ## as using internal code is the default here rather than INLA
##D myres.inla<-fitabn(dag.m=mydag,data.df=mydat,data.dists=mydists,centre=TRUE,
##D                 compute.fixed=TRUE,max.mode.error=100);
##D 
##D print(names(myres.c$marginals));## gives all the different parameter names
##D ## plot posterior densities
##D par(mfrow=c(2,2));
##D plot(myres.c$marginals$b1[["b1|(Intercept)"]],type="b",xlab="b1|(Intercept)",
##D main="Posterior Marginal Density",pch="+");
##D points(myres.inla$marginals$b1[["b1|(Intercept)"]],col="blue");
##D plot(myres.c$marginals$b2[["b2|p4"]],type="b",xlab="b2|p4",
##D main="Posterior Marginal Density",pch="+");
##D points(myres.inla$marginals$b2[["b2|p4"]],col="blue");
##D plot(myres.c$marginals$g1[["g1|precision"]],type="b",xlab="g1|precision",
##D main="Posterior Marginal Density",pch="+");
##D points(myres.inla$marginals$g1[["g1|precision"]],col="blue");
##D plot(myres.c$marginals$b4[["b4|b1"]],type="b",xlab="b4|b1",
##D main="Posterior Marginal Density",pch="+");
##D points(myres.inla$marginals$b4[["b4|b1"]],col="blue");
##D 
##D ### A very simple mixed model example using built-in data
##D ## specify DAG - only two variables using subset of variables from ex3.dag.data
##D ## both variables are assumed to need (separate) adjustment for the group variable
##D ## i.e. a binomial glmm at each node
##D 
##D ## model where b1<-b2
##D mydag<-matrix(data=c(
##D                      0,1, # b1
##D                      0,0  # b2
##D                      ), byrow=TRUE,ncol=2);
##D 
##D colnames(mydag)<-rownames(mydag)<-names(ex3.dag.data[,c(1,2)]);
##D ## specific distributions
##D mydists<-list(b1="binomial",
##D               b2="binomial"
##D              );
##D 
##D ## just compute marginal likelihood - use internal code via max.mode.error=0
##D ## as using INLA is the default here.
##D myres.c<-fitabn(dag.m=mydag,data.df=ex3.dag.data[,c(1,2,14)],data.dists=mydists,
##D                 group.var="group",cor.vars=c("b1","b2"),
##D                 centre=TRUE,compute.fixed=FALSE,max.mode.error=0);
##D print(myres.c);## show all the output 
##D 
##D ## compare modes for node b1 with glmer()
##D require(MASS);
##D require(lme4);
##D m1<-glmer(b1~1+b2+(1|group),family="binomial",data=ex3.dag.data[,c(1,2,14)])
##D print(fixef(m1));
##D print(1/unlist(VarCorr(m1)));
##D print(myres.c$modes$b1);## almost identical to lme4 n.b. glmer() gives variance
##D ##                         fitabn gives precision=1/variance
##D 
##D ## compare with INLA estimate
##D myres.inla<-fitabn(dag.m=mydag,data.df=ex3.dag.data[,c(1,2,14)],
##D                         data.dists=mydists,group.var="group",cor.vars=c("b1","b2"),
##D                         centre=TRUE,compute.fixed=FALSE,max.mode.error=100); 
##D 
##D ## compare log marginal likelihoods for each node and total DAG - should be very similar
##D cbind(unlist(myres.inla[1:3]),unlist(myres.c[1:3]));
##D 
##D ## now for marginals - INLA is strongly preferable for estimating marginals for nodes 
##D ## with random effects as it is far faster, but may not be reliable
##D ## see www.r-bayesian-networks.org/quality-assurance
##D 
##D # INLA's estimates of the marginals, using high n.grid=500
##D # as this makes the plots smoother - see below.
##D myres.inla<-fitabn(dag.m=mydag,data.df=ex3.dag.data[,c(1,2,14)],data.dists=mydists,
##D                         group.var="group",cor.vars=c("b1","b2"),
##D                         compute.fixed=TRUE,max.mode.error=100,
##D                         n.grid=500,max.hessian.error = 10E-02);
##D 
##D ## this is NOT recommended - marginal density estimation using fitabn in mixed models
##D ## is really just for diagnostic purposes, better to use fitabn.inla() here
##D ## but here goes...be patient
##D myres.c<-fitabn(dag.m=mydag,data.df=ex3.dag.data[,c(1,2,14)],data.dists=mydists,
##D                 group.var="group",cor.vars=c("b1","b2"),compute.fixed=TRUE,
##D                 max.mode.error=0,max.hessian.error = 10E-02);
##D 
##D ## compare marginals between internal and INLA.   
##D par(mfrow=c(2,3))
##D ## 5 parameters - two intercepts, one slope, two group level precisions
##D plot(myres.inla$marginals$b1[[1]],type="l",col="blue",lwd=1,pch="+");
##D points(myres.c$marginals$b1[[1]],col="brown",lwd=2);
##D plot(myres.inla$marginals$b1[[2]],type="l",col="blue",lwd=1,pch="+");
##D points(myres.c$marginals$b1[[2]],col="brown",lwd=2);
##D ## the precision of group-level random effects
##D plot(myres.inla$marginals$b1[[3]],type="l",col="blue",xlim=c(0,2),lwd=1,pch="+");
##D points(myres.c$marginals$b1[[3]],col="brown",lwd=2);
##D plot(myres.inla$marginals$b2[[1]],type="l",col="blue",lwd=1,pch="+");
##D points(myres.c$marginals$b2[[1]],col="brown",lwd=2);
##D plot(myres.inla$marginals$b2[[1]],type="l",col="blue",lwd=1,pch="+");
##D points(myres.c$marginals$b2[[1]],col="brown",lwd=2);
##D ## the precision of group-level random effects
##D plot(myres.inla$marginals$b2[[2]],type="l",col="blue",xlim=c(0,2),lwd=1,pch="+");
##D points(myres.c$marginals$b2[[2]],col="brown",lwd=2);
##D 
##D ### these are very similar although not exactly identical
##D 
##D ## use internal code but only to compute a single parameter over a specified grid
##D ## this can be necessary if the simple auto grid finding functions does a poor job
##D 
##D myres.c<-fitabn(dag.m=mydag,data.df=ex3.dag.data[,c(1,2,14)],data.dists=mydists,
##D                 group.var="group",
##D                 cor.vars=c("b1","b2"),centre=FALSE,compute.fixed=TRUE,
##D                 marginal.node=1,marginal.param=3,## precision term in node 1
##D                 variate.vec=seq(0.05,1.5,len=25),max.hessian.error = 10E-02);
##D 
##D par(mfrow=c(1,2));
##D plot(myres.c$marginals[[1]],type="b",col="blue");## still fairly sparse
##D ## an easy way is to use spline to fill in the density without recomputing other
##D ## points provided the original grid is not too sparse.
##D plot(spline(myres.c$marginals[[1]],n=100),type="b",col="brown");
## End(Not run)


