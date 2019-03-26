library(abn)


### Name: search.hillclimber
### Title: Find high scoring directed acyclic graphs using heuristic
###   search.
### Aliases: search.hillclimber
### Keywords: models

### ** Examples

## Not run: 
##D ##############################################
##D ## example 1: use built-in simulated data set
##D ##############################################
##D 
##D mydat<-ex1.dag.data; ## this data comes with abn see ?ex1.dag.data
##D 
##D ## setup distribution list for each node
##D mydists<-list(b1="binomial",
##D               p1="poisson",
##D               g1="gaussian",
##D               b2="binomial",
##D               p2="poisson",
##D               b3="binomial",
##D               g2="gaussian",
##D               b4="binomial",
##D               b5="binomial",
##D               g3="gaussian"
##D              );
##D 
##D ## not run because may take some minutes for buildscorecache() 
##D ## parent limits
##D max.par<-list("b1"=4,"p1"=4,"g1"=4,"b2"=4,"p2"=4,"b3"=4,"g2"=4,"b4"=4,"b5"=4,"g3"=4);
##D ## now build cache
##D 
##D mycache<-buildscorecache(data.df=mydat,data.dists=mydists,,max.parents=max.par);
##D 
##D # now peform 1000 greedy searches
##D heur.res<-search.hillclimber(score.cache=mycache,
##D num.searches=1000,seed=0,verbose=FALSE,timing.on=FALSE);
##D 
##D # repeat but this time have the majority consensus network plotted as the searches progress
##D heur.res2<-search.hillclimber(score.cache=mycache,
##D num.searches=1000,seed=0,verbose=FALSE,trace=TRUE,timing.on=FALSE);
##D 
##D ###################################################################################################
##D ## example 2 - glmm example - but no difference here as the format of the score cache is identical
##D ###################################################################################################
##D 
##D mydat<-ex3.dag.data[,c(1:5,14)];## this data comes with abn see ?ex1.dag.data
##D 
##D mydists<-list(b1="binomial",
##D               b2="binomial",
##D               b3="binomial",
##D               b4="binomial",
##D               b5="binomial"
##D              );
##D max.par<-3;
##D 
##D mycache.mixed<-buildscorecache(data.df=mydat,data.dists=mydists,group.var="group",
##D                                cor.vars=c("b1","b2","b3","b4","b5"),
##D                                max.parents=max.par, which.nodes=c(1:5));
##D 
##D # now peform 1000 greedy searches
##D heur.res<-search.hillclimber(score.cache=mycache.mixed,num.searches=1000,
##D           seed=0,verbose=FALSE,timing.on=FALSE);
##D 
##D plotabn(dag.m = heur.res$consensus,data.dists = mydists)
##D 
##D # repeat but this time have the majority consensus network plotted as the searches progress
##D heur.res2<-search.hillclimber(score.cache=mycache.mixed,num.searches=1000,seed=0,
##D verbose=FALSE,trace=TRUE,timing.on=FALSE);
## End(Not run)


