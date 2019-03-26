library(abn)


### Name: buildscorecache
### Title: Build a cache of goodness of fit metrics for each node in a DAG,
###   possibly subject to user defined restrictions
### Aliases: buildscorecache
### Keywords: laplace

### ** Examples

## Not run: 
##D #################################################################
##D ## Example 1
##D #################################################################
##D 
##D mydat<-ex0.dag.data[,c("b1","b2","g1","g2","b3","g3")];## take a subset of cols
##D 
##D ## setup distribution list for each node
##D mydists<-list(b1="binomial",
##D               b2="binomial",
##D               g1="gaussian",
##D               g2="gaussian",
##D               b3="binomial",
##D               g3="gaussian"
##D              );
##D 
##D ban<-matrix(rep(0,dim(mydat)[2]^2),ncol=dim(mydat)[2]);# ban nothing
##D colnames(ban)<-rownames(ban)<-names(mydat); #names must be set
##D ban["b1","b2"]<-1; # now ban arc from b2 to b1 
##D retain<-matrix(rep(0,dim(mydat)[2]^2),ncol=dim(mydat)[2]);# retain nothing
##D colnames(retain)<-rownames(retain)<-names(mydat); #names must be set
##D retain["g1","g3"]<-1; # always retain arc from g3 to g1
##D # parent limits
##D max.par<-list("b1"=4,"b2"=4,"g1"=4,"g2"=0,"b3"=4,"g3"=4);
##D 
##D ## now build cache of scores (goodness of fits for each node)
##D 
##D res.c<-buildscorecache(data.df=mydat,data.dists=mydists,
##D                      dag.banned=ban, dag.retained=retain,max.parents=max.par
##D                      );
##D 
##D ## repeat but using R-INLA. The mlik's should be virtually identical.
##D ## now build cache
##D res.inla<-buildscorecache(data.df=mydat,data.dists=mydists,
##D                      dag.banned=ban, dag.retained=retain,max.parents=max.par,
##D                      max.mode.error=100);
##D 
##D ## plot comparison - very similar
##D plot(res.c$mlik,res.inla$mlik,pch="+");abline(0,1);
##D 
##D 
##D #################################################################
##D ## Example 2 - much bigger problem using glm - make take a while
##D #################################################################
##D 
##D mydat<-ex2.dag.data;## this data comes with abn see ?ex2.dag.data
##D 
##D ## setup distribution list for each node
##D mydists<-list(b1="binomial",
##D               g1="gaussian",
##D               p1="poisson",
##D               b2="binomial",
##D               g2="gaussian",
##D               p2="poisson",
##D               b3="binomial",
##D               g3="gaussian",
##D               p3="poisson",
##D               b4="binomial",
##D               g4="gaussian",
##D               p4="poisson",
##D               b5="binomial",
##D               g5="gaussian",
##D               p5="poisson",
##D               b6="binomial",
##D               g6="gaussian",
##D               p6="poisson"
##D              );
##D 
##D ## parent limits
##D max.par<-list("b1"=4,"g1"=4,"p1"=4,"b2"=4,"g2"=4,"p2"=4,"b3"=4,
##D               "g3"=4,"p3"=4,"b4"=4,"g4"=4,
##D                "p4"=4,"b5"=4,"g5"=4,"p5"=4,"b6"=4,"g6"=4,"p6"=4);
##D 
##D ## no explicit ban or retain restrictions set so dont need to supply ban
##D ##  or retain matrices
##D 
##D ## now build cache using internal code just for nodes 1,2 and 3
##D ## e.g. "b1", "p1" and "g1" 
##D mycache.c<-buildscorecache(data.df=mydat,data.dists=mydists,
##D                          max.parents=max.par, which.nodes=c(1:3));
##D 
##D ###################################################################
##D ## Example 3 - grouped data - random effects example e.g. glmm
##D ###################################################################
##D 
##D mydat<-ex3.dag.data;## this data comes with abn see ?ex3.dag.data
##D 
##D mydists<-list(b1="binomial",
##D               b2="binomial",
##D               b3="binomial",
##D               b4="binomial",
##D               b5="binomial",
##D               b6="binomial",
##D               b7="binomial",
##D               b8="binomial",
##D               b9="binomial",
##D               b10="binomial",
##D               b11="binomial",
##D               b12="binomial",
##D               b13="binomial"
##D              );
##D max.par<-2;
##D 
##D ## in this example INLA is used as default since these are glmm nodes
##D ## when running this at node-parent combination 71 the default accuracy check on the 
##D ## INLA modes is exceeded (default is a max. of 10 percent difference from
##D ## modes estimated using internal code) and a message is given that internal code
##D ## will be used in place of INLA's results.
##D 
##D mycache<-buildscorecache(data.df=mydat,data.dists=mydists,group.var="group",
##D                          cor.vars=c("b1","b2","b3","b4","b5","b6","b7",
##D                                     "b8","b9","b10",
##D                                     "b11","b12","b13"),
##D                          max.parents=max.par, which.nodes=c(1));
## End(Not run)


