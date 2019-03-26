library(GHap)


### Name: ghap.blup
### Title: Convert breeding values into BLUP solutions of HapAllele effects
### Aliases: ghap.blup

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
# #BLUP GWAS
# gebvs <- model$random$individual
# gebvsw <- table(sim$data$individual)
# gebvsw <- gebvsw + mean(gebvsw)
# gebvsw <- gebvsw[names(gebvs)]
# Kinv <- ghap.kinv(K)
# gwas.blup <- ghap.blup(gebvs = gebvs, haplo = haplo, gebvsweights = gebvsw,
#                        ncores = 4, invcov = Kinv)
# plot(gwas.blup$BP1/1e+6,gwas.blup$pVAR*100,pch=20,
#      xlab="Position (in Mb)",ylab="Variance explained (%)")
# abline(v=haplo$bp1[major]/1e+6)
# #BLUP with one update
# w <- gwas.blup$VAR*nrow(gwas.blup)
# K2 <- ghap.kinship(haplo=haplo,weights = w)
# Kinv2 <- ghap.kinv(K2)
# gwas.blup2 <- ghap.blup(gebvs = gebvs, haplo = haplo, invcov = Kinv2, ncores = 2,
#                         gebvsweights = gebvsw, haploweights = w)
# plot(gwas.blup2$BP1/1e+6,gwas.blup2$pVAR*100,pch=20,
#      xlab="Position (in Mb)",ylab="Variance explained (%)")
# abline(v=haplo$bp1[major]/1e+6)




