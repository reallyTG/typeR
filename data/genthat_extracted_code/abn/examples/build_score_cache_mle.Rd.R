library(abn)


### Name: buildscorecache.mle
### Title: Build a cache of goodness of fit metrics based on Information
###   Theoretic for each node in a DAG, possibly subject to user defined
###   restrictions
### Aliases: buildscorecache.mle
### Keywords: glm, network score

### ** Examples

mydat <- ex0.dag.data[,c("b1","b2","g1","g2","b3","g3")] ## take a subset of cols

## setup distribution list for each node
mydists <- list(b1="binomial",
              b2="binomial",
              g1="gaussian",
              g2="gaussian",
              b3="binomial",
              g3="gaussian"
             )
             
## now build cache of scores (goodness of fits for each node)

res.mle <- buildscorecache.mle(data.df=mydat,data.dists=mydists,max.parents=3)
res.abn <- buildscorecache(data.df=mydat,data.dists=mydists,max.parents=3)

#plot(-res.mle$bic,res.abn$mlik)



