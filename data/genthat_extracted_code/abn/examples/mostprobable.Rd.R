library(abn)


### Name: mostprobable
### Title: Find most probable DAG structure
### Aliases: mostprobable
### Keywords: models

### ** Examples

## Not run: 
##D ## use built-in simulated data set
##D 
##D mydat<-ex0.dag.data[,c("b1","b2","g1","g2","p1","p2")];
##D ## take a subset of cols
##D 
##D ## setup distribution list for each node
##D mydists<-list(b1="binomial",
##D               b2="binomial",
##D               g1="gaussian",
##D               g2="gaussian",
##D               p1="poisson",
##D               p2="poisson"
##D              );
##D 
##D #use simple banlist with no constraints
##D ban<-matrix(c(
##D 		    #   1 2 3 4 5 6    
##D 			0,0,0,0,0,0, # 1 
##D 			0,0,0,0,0,0, # 2
##D 			0,0,0,0,0,0, # 3 
##D 			0,0,0,0,0,0, # 4
##D 			0,0,0,0,0,0, # 5 
##D 			0,0,0,0,0,0 # 6     
##D                ),byrow=TRUE,ncol=6);
##D 
##D colnames(ban)<-rownames(ban)<-names(mydat); #names must be set
##D ban["b1","b2"]<-1; # now ban arc from b2 to b1 
##D 
##D retain<-matrix(c(
##D 		    #   1 2 3 4 5 6    
##D                         0,0,0,0,0,0, # 1 
##D 			0,0,0,0,0,0, # 2
##D 			0,0,0,0,0,0, # 3 
##D 			0,0,0,0,0,0, # 4
##D 			0,0,0,0,0,0, # 5 
##D 			0,0,0,0,0,0 # 6     
##D                   ),byrow=TRUE,ncol=6);
##D 
##D colnames(retain)<-rownames(retain)<-names(mydat); #names must be set
##D retain["g1","g2"]<-1; # always retain arc from g2 to g1
##D # parent limits
##D max.par<-list("b1"=1,"b2"=1,"g1"=1,"g2"=0,"p1"=1,"p2"=2);
##D ## now build cache
##D mycache<-buildscorecache(data.df=mydat,data.dists=mydists,
##D                      dag.banned=ban, dag.retained=retain,max.parents=max.par);
##D 
##D #now find the globally best DAG
##D mp.dag<-mostprobable(score.cache=mycache);
##D # get the corresponding best goodness of fit - network score
##D fitabn(dag.m=mp.dag,data.df=mydat,data.dists=mydists)$mlik;
##D 
##D ## Second example ############
##D 
##D mydat<-ex1.dag.data;## this data comes with abn see ?ex1.dag.data
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
##D #use simple banlist with no constraints
##D ban<-matrix(c(
##D 		    #   1 2 3 4 5 6    
##D 			0,0,0,0,0,0,0,0,0,0, # 1 
##D 			0,0,0,0,0,0,0,0,0,0, # 2
##D 			0,0,0,0,0,0,0,0,0,0, # 3 
##D 			0,0,0,0,0,0,0,0,0,0, # 4
##D 			0,0,0,0,0,0,0,0,0,0, # 5 
##D 			0,0,0,0,0,0,0,0,0,0, # 6
##D 			0,0,0,0,0,0,0,0,0,0, # 7 
##D 			0,0,0,0,0,0,0,0,0,0, # 8
##D 			0,0,0,0,0,0,0,0,0,0, # 9 
##D 			0,0,0,0,0,0,0,0,0,0  # 10     
##D                                            ),byrow=TRUE,ncol=10);
##D 
##D colnames(ban)<-rownames(ban)<-names(mydat); #names must be set
##D 
##D retain<-matrix(c(
##D 		    #   1 2 3 4 5 6    
##D 			0,0,0,0,0,0,0,0,0,0, # 1 
##D 			0,0,0,0,0,0,0,0,0,0, # 2
##D 			0,0,0,0,0,0,0,0,0,0, # 3 
##D 			0,0,0,0,0,0,0,0,0,0, # 4
##D 			0,0,0,0,0,0,0,0,0,0, # 5 
##D 			0,0,0,0,0,0,0,0,0,0, # 6
##D 			0,0,0,0,0,0,0,0,0,0, # 7 
##D 			0,0,0,0,0,0,0,0,0,0, # 8
##D 			0,0,0,0,0,0,0,0,0,0, # 9 
##D 			0,0,0,0,0,0,0,0,0,0  # 10     
##D                                            ),byrow=TRUE,ncol=10);
##D colnames(retain)<-rownames(retain)<-names(mydat); #names must be set
##D 
##D ## parent limits
##D max.par<-list("b1"=4,"p1"=4,"g1"=4,"b2"=4,"p2"=4,"b3"=4,"g2"=4,"b4"=4,"b5"=4,"g3"=4);
##D ## now build cache
##D mycache<-buildscorecache(data.df=mydat,data.dists=mydists,
##D                      dag.banned=ban, dag.retained=retain,max.parents=max.par);
##D 
##D #now find the globally best DAG
##D mp.dag<-mostprobable(score.cache=mycache);
##D fitabn(dag.m=mp.dag,data.df=mydat,data.dists=mydists)$mlik;
##D 
##D ## plot the best model
##D myres<-fitabn(dag.m=mp.dag,data.df=mydat,data.dists=mydists,create.graph=TRUE);
##D 
##D plotabn(dag.m = mp.dag,data.dists = mydat,fitted.values.abn = myres)
##D 
##D ## fit the known true DAG
##D true.dag<-ban;
##D true.dag["p2",c("b1","p1")]<-1;
##D true.dag["b3",c("b1","g1","b2")]<-1;
##D true.dag["g2",c("p1","g1","b2")]<-1;
##D true.dag["b4",c("g1","p2")]<-1;
##D true.dag["b5",c("g1","g2")]<-1;
##D true.dag["g3",c("g1","b2")]<-1;
##D 
##D fitabn(dag.m=true.dag,data.df=mydat,data.dists=mydists)$mlik;
##D 
##D #################################################################
##D ## example 3 - models with random effects
##D #################################################################
##D 
##D mydat<-ex3.dag.data[,c(1:4,14)];
##D ## this data comes with abn see ?ex3.dag.data
##D 
##D mydists<-list(b1="binomial",
##D               b2="binomial",
##D               b3="binomial",
##D               b4="binomial"
##D              );
##D max.par<-3;
##D 
##D mycache.c<-buildscorecache(data.df=mydat,data.dists=mydists,
##D            group.var="group",cor.vars=c("b1","b2","b3","b4"),
##D      ## each node uses a random effect adjustment
##D            max.parents=max.par);                         
##D 
##D ## find the most probable DAG
##D mp.dag<-mostprobable(score.cache=mycache.c);
##D 
##D ## get goodness of fit
##D fitabn(dag.m=mp.dag,data.df=mydat,data.dists=mydists,
##D group.var="group",cor.vars=c("b1","b2","b3","b4"))$mlik;
##D 
## End(Not run)


