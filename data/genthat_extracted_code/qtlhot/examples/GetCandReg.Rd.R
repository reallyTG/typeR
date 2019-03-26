library(qtlhot)


### Name: GetCandReg
### Title: Get genetic information on candidate regulators and co-mapping
###   traits.
### Aliases: GetCandReg GetCisCandReg GetCoMappingTraits
### Keywords: utilities

### ** Examples

## data(CMSTCross) is loaded lazily.
CMSTscan <- scanone(CMSTCross, pheno.col = 1:3, method = "hk")
CMSThigh <- highlod(CMSTscan)
traits <- names(CMSTCross$pheno)
annot <- data.frame(name = traits, traits = traits, chr = rep(1, 3),
 Mb.pos = c(55,10,100))
annot$cM.pos <- annot$Mb.pos
cand.reg <- GetCandReg(CMSThigh, annot, traits)
cis.cand.reg <- GetCisCandReg(CMSThigh, cand.reg)
comap.targets <- GetCoMappingTraits(CMSThigh, cand.reg)



