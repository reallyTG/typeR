library(CJAMP)


### Name: generate_phenodata
### Title: Functions to generate phenotype data.
### Aliases: generate_phenodata generate_phenodata_1_simple
###   generate_phenodata_1 generate_phenodata_2_bvn
###   generate_phenodata_2_copula

### ** Examples


# Generate genetic data:
genodata <- generate_genodata(n_SNV = 20, n_ind = 1000)
compute_MAF(genodata)

# Generate different phenotype data:
phenodata1 <- generate_phenodata_1_simple(genodata = genodata[,1],
                                          type = "quantitative", b = 0)
phenodata2 <- generate_phenodata_1_simple(genodata = genodata[,1],
                                          type = "quantitative", b = 2)
phenodata3 <- generate_phenodata_1_simple(genodata = genodata,
                                          type = "quantitative", b = 2)
phenodata4 <- generate_phenodata_1_simple(genodata = genodata,
                                          type = "quantitative",
                                          b = seq(0.1, 2, 0.1))
phenodata5 <- generate_phenodata_1_simple(genodata = genodata[,1],
                                          type = "binary", b = 0)

phenodata6 <- generate_phenodata_1(genodata = genodata[,1],
                                   type = "quantitative", b = 0,
                                   MAF_cutoff = 1, prop_causal = 0.1,
                                   direction = "a")
phenodata7 <- generate_phenodata_1(genodata = genodata,
                                   type = "quantitative", b = 0.6,
                                   MAF_cutoff = 0.03, prop_causal = 0.1,
                                   direction = "a")
phenodata8 <- generate_phenodata_1(genodata = genodata,
                                   type = "quantitative",
                                   b = seq(0.1, 2, 0.1),
                                   MAF_cutoff = 0.03, prop_causal = 0.1,
                                   direction = "a")

phenodata9 <- generate_phenodata_2_bvn(genodata = genodata[,1],
                                       tau = 0.5, b1 = 0, b2 = 0)
phenodata10 <- generate_phenodata_2_bvn(genodata = genodata,
                                        tau = 0.5, b1 = 0, b2 = 0)
phenodata11 <- generate_phenodata_2_bvn(genodata = genodata,
                                        tau = 0.5, b1 = 1,
                                        b2 = seq(0.1,2,0.1))
phenodata12 <- generate_phenodata_2_bvn(genodata = genodata,
                                        tau = 0.5, b1 = 1, b2 = 2)
par(mfrow = c(3, 1))
hist(phenodata12$Y1)
hist(phenodata12$Y2)
plot(phenodata12$Y1, phenodata12$Y2)

phenodata13 <- generate_phenodata_2_copula(genodata = genodata[,1],
                                           MAF_cutoff = 1, prop_causal = 1,
                                           tau = 0.5, b1 = 0, b2 = 0)
phenodata14 <- generate_phenodata_2_copula(genodata = genodata,
                                           MAF_cutoff = 1, prop_causal = 0.5,
                                           tau = 0.5, b1 = 0, b2 = 0)
phenodata15 <- generate_phenodata_2_copula(genodata = genodata,
                                           MAF_cutoff = 1, prop_causal = 0.5,
                                           tau = 0.5, b1 = 0, b2 = 0)
phenodata16 <- generate_phenodata_2_copula(genodata = genodata,
                                           MAF_cutoff = 1, prop_causal = 0.5,
                                           tau = 0.2, b1 = 0.3,
                                           b2 = seq(0.1, 2, 0.1))
phenodata17 <- generate_phenodata_2_copula(genodata = genodata,
                                           MAF_cutoff = 1, prop_causal = 0.5,
                                           tau = 0.2, b1 = 0.3, b2 = 0.3)
par(mfrow = c(3, 1))
hist(phenodata17$Y1)
hist(phenodata17$Y2)
plot(phenodata17$Y1, phenodata17$Y2)









