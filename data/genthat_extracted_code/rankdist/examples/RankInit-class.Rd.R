library(rankdist)


### Name: RankInit-class
### Title: RankInit Class
### Aliases: RankInit RankInit-class

### ** Examples

c1init = new("RankInit",param.init=list(rep(1,4)),
     modal_ranking.init=list(c(2,3,4,1,5)),clu=1L)
c2init = new("RankInit",param.init=list(rep(0.1,4),rep(0.1,4)),
     modal_ranking.init = list(c(2,3,4,1,5),c(2,5,1,4,3)),clu=2L,p.init=c(0.5,0.5))



