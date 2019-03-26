library(tcgsaseq)


### Name: compute_sim_voomlike_genewise
### Title: Computing simulations results observation-wise
### Aliases: compute_sim_voomlike_genewise
### Keywords: internal

### ** Examples


## Not run: 
##D rm(list=ls())
##D data_sims <- data_sim_voomlike(seed=1, do_gs=FALSE)
##D res <- compute_sim_voomlike_genewise(counts = data_sims$counts,
##D                                     design = data_sims$design,
##D                                     indiv = data_sims$indiv,
##D                                     alternative=TRUE,
##D                                     fixed_eff = 0.5,
##D                                     fixed_eff_sd = 0,
##D                                     rand_eff_sd = 0,
##D                                     RE_indiv_sd=NULL)
##D res_all <- cbind(res$res_voom, res$res_perso, res$res_noweights, res$res_DEseq, res$res_edgeR)
##D colnames(res_all) <- c(paste0(rep(c("asym", "perm", "camera", "roast"), 3),
##D                              rep(c("_voom", "_perso", "_noweights"), each=4)),
##D                       paste0("DESeq2_minTest_", c("exact", "approx", "CN")), "roast_edgeR")
## End(Not run)




