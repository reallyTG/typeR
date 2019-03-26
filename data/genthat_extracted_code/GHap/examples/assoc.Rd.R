library(GHap)


### Name: ghap.assoc
### Title: Association analysis for HapAlleles
### Aliases: ghap.assoc

### ** Examples


# #### DO NOT RUN IF NOT NECESSARY ###
# 
# # Copy the example data in the current working directory
# ghap.makefile()
# 
# # Load data
# phase <- ghap.loadphase("human.samples", "human.markers", "human.phase")
# 
# # Subset data - markers with maf > 0.05
# maf <- ghap.maf(phase, ncores = 2)
# markers <- phase$marker[maf > 0.05]
# phase <- ghap.subsetphase(phase, unique(phase$id), markers)
# 
# # Generate blocks of 5 markers sliding 5 markers at a time
# blocks.mkr <- ghap.blockgen(phase, windowsize = 5, slide = 5, unit = "marker")
#
# # Generate matrix of haplotype genotypes
# ghap.haplotyping(phase, blocks.mkr, batchsize = 100, ncores = 2, outfile = "human")
#
# # Load haplotype genotypes
# haplo <- ghap.loadhaplo("human.hapsamples", "human.hapalleles", "human.hapgenotypes")
#
#
# ### RUN ###
# # Subset common haplotypes in Europeans
# EUR.ids <- haplo$id[haplo$pop %in% c("TSI","CEU")]
# haplo <- ghap.subsethaplo(haplo,EUR.ids,rep(TRUE,times=haplo$nalleles))
# hapstats <- ghap.hapstats(haplo, ncores = 2)
# common <- hapstats$TYPE %in% c("REGULAR","MAJOR") &
#  hapstats$FREQ > 0.05 &
#  hapstats$FREQ < 0.95
# haplo <- ghap.subsethaplo(haplo,EUR.ids,common)
#
# #Compute relationship matrix
# K <- ghap.kinship(haplo, batchsize = 100)
# 
# # Quantitative trait with 50% heritability
# # Unbalanced repeated measurements (0 to 30)
# # Two major haplotypes accounting for 50% of the genetic variance
# myseed <- 123456789
# set.seed(myseed)
# major <- sample(which(haplo$allele.in == TRUE),size = 2)
# g2 <- runif(n = 2, min = 0, max = 1)
# g2 <- (g2/sum(g2))*0.5
# sim <- ghap.simpheno(haplo, kinship = K, h2 = 0.5, g2 = g2, nrep = 30,
#                      balanced = FALSE, major = major, seed = myseed)
# 
# #Fit model using REML
# model <- ghap.lmm(fixed = phenotype ~ 1, random = ~ individual,
#                   covmat = list(individual = K), data = sim$data)
# 
#
# ### RUN ###
# 
# #HapAllele GWAS using GEBVs as response
# pheno <- model$random$individual
# gwas1 <- ghap.assoc(response = pheno, haplo = haplo, ncores = 4)
# 
# #HapAllele GWAS using GEBVs as response
# #Weight observations by number of repeated measurements
# pheno <- model$random$individual
# w <- table(sim$data$individual)
# w <- w + mean(w)
# w <- w[names(pheno)]
# gwas2 <- ghap.assoc(response = pheno, haplo = haplo, ncores = 4, weights = w)
# 
# #HapAllele GWAS using residuals as response
# pheno <- model$residuals
# names(pheno) <- sim$data$individual
# gwas3 <- ghap.assoc(response = pheno, haplo = haplo, ncores = 4)
# 
# #Plot results
# plot(gwas1$BP1/1e+6,gwas1$logP,pch=20,col="darkgreen",ylim=c(0,20),
#      xlab="Position (in Mb)",ylab=expression(-log[10](p)))
# points(gwas2$BP1/1e+6,gwas2$logP,pch=20,col="gray")
# points(gwas3$BP1/1e+6,gwas3$logP,pch=20,col="blue")
# abline(v=haplo$bp1[major]/1e+6,lty=3)
# abline(h=-log10(0.05/nrow(gwas1)),lty=3)
# legend("topleft",legend = c("GEBVs","weighted GEBVs","residuals"),
#        pch = 20,col=c("darkgreen","gray","blue"))




