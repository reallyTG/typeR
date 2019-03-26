library(adephylo)


### Name: dibas
### Title: DIstance-Based Assignment
### Aliases: dibas dibas.matrix dibas.dist dibas.phylo dibas.vector
###   simDatGroups dibas.matrix dibas.vector dibas.phylo dibas.dist
### Keywords: multivariate

### ** Examples


## Not run: 
##D if(require(ape)){
##D #### SIMPLE SIMULATED DATA ####
##D ## 50 variables, 2 groups, 30 indiv
##D dat <- simDatGroups(k=2, p=50, n=c(15,15), mu=c(0,1))
##D names(dat)
##D 
##D ## make a tree
##D tre <- nj(dist(dat$dat))
##D plot(tre,type="unr", tip.col=c("blue","red")[as.integer(dat$grp)],
##D    main="simulated data - tree")
##D  
##D ## use dibas method
##D res <- dibas(tre, dat$grp, metric="nNodes")
##D res
##D 
##D barplot(t(res$prob), main="group membership probabilities")
##D 
##D 
##D 
##D #### NON-PARAMETRIC TEST BASED ON MEAN SUCCESSFUL ASSIGNMENT ####
##D ## use dibas method
##D distHo <- replicate(100,
##D    dibas(tre, sample(dat$grp), metric="patristic")$mean.ok)
##D pval <- mean(res$mean.ok<=c(distHo,res$mean.ok))
##D pval
##D 
##D hist(c(distHo,res$mean.ok), col="grey",
##D    main="Mean successful assignement - permuted values")
##D abline(v=res$mean.ok, col="red")
##D mtext(side=3, text="Observed value in red")
##D 
##D 
##D 
##D #### HAND FAN SYNDROME ####
##D ## 50 variables, 2 groups, 30 indiv
##D dat <- simDatGroups(k=2, p=50, n=c(15,15), mu=c(0,1), sigma=c(2,4))
##D names(dat)
##D 
##D ## make a tree
##D tre <- nj(dist(dat$dat))
##D plot(tre,type="unr", tip.col=c("blue","red")[as.integer(dat$grp)],
##D    main="simulated data - tree")
##D mtext(side=3, text="hand-fan syndrome")
##D 
##D ## use dibas method
##D res.patri <- dibas(tre, dat$grp, metric="patristic")
##D res.patri$grp.tab # poor results
##D plot(table(res.patri$groups), main="Group assignment - dibas patristic")
##D 
##D res <- dibas(tre, dat$grp, metric="nNodes")
##D res$grp.tab # results OK
##D plot(table(res$groups), main="Group assignment - dibas nNodes")
##D 
##D 
##D 
##D 
##D #### MORE COMPLEX DATASET ####
##D if(require(adegenet)){
##D 
##D dat <- simDatGroups(k=5, p=50, n=c(5,10,10,30,60), mu=sample(1:5, 5,
##D    replace=TRUE), sigma=sample(1:5)/2)
##D names(dat)
##D 
##D ## make a tree
##D tre <- nj(dist(dat$dat))
##D plot(tre,type="unr", tip.col=fac2col(dat$grp),main="simulated data - tree")
##D 
##D ## use dibas method
##D res <- dibas(tre, dat$grp, metric="Abouheif")
##D res
##D 
##D plot(table(res$groups), main="Group assignment - dibas Abouheif")
##D 
##D }
##D }
## End(Not run)










