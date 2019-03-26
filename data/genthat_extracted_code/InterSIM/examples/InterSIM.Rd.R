library(InterSIM)


### Name: InterSIM
### Title: InterSIM
### Aliases: InterSIM CpG.gene.map.for.DEG cov.M cov.expr cov.protein
###   mean.M mean.expr mean.expr.with.mapped.protein mean.protein
###   methyl.gene.level.mean protein.gene.map.for.DEP rho.expr.protein
###   rho.methyl.expr rev.logit logit

### ** Examples

#
prop <- c(0.20,0.30,0.27,0.23)
effect <- 5
sim.data <- InterSIM(n.sample=500, cluster.sample.prop = prop,
delta.methyl=effect, delta.expr=effect, delta.protein=effect,
p.DMP=0.2, p.DEG=NULL, p.DEP=NULL,
sigma.methyl=NULL, sigma.expr=NULL, sigma.protein=NULL,
cor.methyl.expr=NULL, cor.expr.protein=NULL,
do.plot=FALSE, sample.cluster=TRUE, feature.cluster=TRUE)
sim.methyl <- sim.data$dat.methyl
sim.expr <- sim.data$dat.expr
sim.protein <- sim.data$dat.protein




