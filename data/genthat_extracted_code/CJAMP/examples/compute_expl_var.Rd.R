library(CJAMP)


### Name: compute_expl_var
### Title: Phenotypic variance explained by genetic variants.
### Aliases: compute_expl_var

### ** Examples


genodata <- generate_genodata(n_SNV = 20, n_ind = 1000)
phenodata <- generate_phenodata_1_simple(genodata = genodata[,1],
                                         type = "quantitative", b = 0)
compute_expl_var(genodata = genodata, phenodata = phenodata$Y,
                 type = c("Rsquared_unadj", "Rsquared_adj"),
                 causal_idx = NULL, effect_causal = NULL)




