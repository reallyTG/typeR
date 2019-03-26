library(fwsim)


### Name: mutmodel
### Title: Mutation model logic
### Aliases: mutmodel_not_mut mutmodel_dw_mut mutmodel_up_mut
###   approx_stationary_dist
### Keywords: Fisher-Wright

### ** Examples

mutpars.locus1 <- c(0.149,   2.08,    18.3,   0.149,   0.374,   27.4) # DYS19
mutpars.locus2 <- c(0.500,   1.18,    18.0,   0.500,   0.0183,  349)  # DYS389I
mutpars.locus3 <- c(0.0163,  17.7,    11.1,   0.0163,  0.592,   14.1)  # DYS391
mutpars <- matrix(c(mutpars.locus1, mutpars.locus2, mutpars.locus3), ncol = 3)
colnames(mutpars) <- c("DYS19", "DYS389I", "DYS391")
mutmodel <- init_mutmodel(modeltype = 2L, mutpars = mutpars)

mutmodel_not_mut(mutmodel, locus = 1L, alleles = 10L:20L)
mutmodel_dw_mut(mutmodel, locus = 1L, alleles = 10L:20L)
mutmodel_up_mut(mutmodel, locus = 1L, alleles = 10L:20L)

statdists <- approx_stationary_dist(mutmodel, alleles = 5L:20L)
bp <- barplot(statdists, beside = TRUE)
text(bp, 0.02, round(statdists, 1), cex = 1, pos = 3) 
text(bp, 0, rep(rownames(statdists), ncol(mutmodel$mutpars)), cex = 1, pos = 3)


mutpars <- matrix(c(c(0.003, 0.001), rep(0.004, 2), rep(0.001, 2)), ncol = 3)
colnames(mutpars) <- c("DYS19", "DYS389I", "DYS391")
mutmodel <- init_mutmodel(modeltype = 1L, mutpars = mutpars)
mutmodel
statdists <- approx_stationary_dist(mutmodel, alleles = 5L:20L)
statdists

bp <- barplot(statdists, beside = TRUE)
text(bp, 0.02, round(statdists, 1), cex = 1, pos = 3) 
text(bp, 0, rep(rownames(statdists), ncol(mutmodel$mutpars)), cex = 1, pos = 3)



