library(tcgsaseq)


### Name: compute_sim_voomlike
### Title: Computing simulations results
### Aliases: compute_sim_voomlike
### Keywords: internal

### ** Examples


## Not run: 
##D data_sims <- data_sim_voomlike(seed=1)
##D res <- compute_sim_voomlike(counts = data_sims$counts,
##D                            design = data_sims$design,
##D                            gs_keep = data_sims$gs_keep,
##D                            indiv = data_sims$indiv,
##D                            alternative=TRUE,
##D                            fixed_eff = 0.5,
##D                            fixed_eff_sd = 0,
##D                            rand_eff_sd = 0,
##D                            RE_indiv_sd=NULL)
##D res_all <- cbind(res$res_voom, res$res_perso, res$res_noweights, res$res_DEseq, res$res_edgeR)
##D colnames(res_all) <- c(paste0(rep(c("asym", "perm", "camera", "roast"), 3),
##D                              rep(c("_voom", "_perso", "_noweights"), each=4)),
##D                       paste0("DESeq2_minTest_", c("exact", "approx", "CN")), "roast_edgeR")
## End(Not run)




