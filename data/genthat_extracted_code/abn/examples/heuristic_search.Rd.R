library(abn)


### Name: search.heuristic
### Title: A familly of heuristic algorithms that aims at finding high
###   scoring directed acyclic graphs
### Aliases: search.heuristic
### Keywords: models

### ** Examples

## Not run: 
##D ##############################################
##D ## example: use built-in simulated data set
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
##D mycache<-buildscorecache(data.df=mydat,data.dists=mydists
##D ,max.parents=2);
##D 
##D # now peform 100 greedy searches
##D heur.res<-search.heuristic(score.cache = mycache,score = "bic",data.dists = mydists,
##D max.parents = 4,start.dag = "random",num.searches = 100,
##D max.steps = 500,seed = 42,verbose = FALSE,algo = "hc")
##D 
##D 
##D plotabn(dag.m = heur.res$dag,data.dists = mydists)
## End(Not run)


