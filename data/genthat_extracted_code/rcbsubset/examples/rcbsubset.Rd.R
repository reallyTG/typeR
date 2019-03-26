library(rcbsubset)


### Name: rcbsubset
### Title: Optimal Matching with Refined Covariate Balance
### Aliases: rcbsubset

### ** Examples


library(optmatch)	
data(nuclearplants)

#match exactly on 3 binaries
exact.mask <- exactMatch(pr ~ pt + ct + bw, data = nuclearplants)
my.dist.matrix <- match_on(pr ~ date + t1 + t2 + cap + ne + cum.n,
	within = exact.mask, data = nuclearplants)

#one treated unit out of 10 is excluded
rcbsubset(my.dist.matrix)

#repeat under a refined balance constraint
rcbsubset(my.dist.matrix, fb.list = list('ne'), 
 treated.info = nuclearplants[which(nuclearplants$pr ==1),],
 control.info = nuclearplants[which(nuclearplants$pr == 0),])

#specifying a low exclude.penalty leads to more individuals excluded
rcbsubset(my.dist.matrix, fb.list = list('ne'), 
 treated.info = nuclearplants[which(nuclearplants$pr ==1),],
 control.info = nuclearplants[which(nuclearplants$pr == 0),], exclude.penalty = 1.5)

## Not run: 
##D #match using distance objects created by rcbalance package
##D library(rcbalance)
##D 
##D my.dist.struct <- build.dist.struct(z = nuclearplants$pr, 
##D 	X = subset(nuclearplants[c('date','t1','t2','cap','ne','cum.n')]),
##D 	exact = paste(nuclearplants$pt, nuclearplants$ct, nuclearplants$bw, sep = '.'))
##D 	
##D rcbsubset(my.dist.struct, fb.list = list('ne'), 
##D  treated.info = nuclearplants[which(nuclearplants$pr ==1),],
##D  control.info = nuclearplants[which(nuclearplants$pr == 0),], exclude.penalty = 15)	
##D 
## End(Not run)



