library(pegas)


### Name: LDscan
### Title: Multi-Locus Linkage Disequilibrium
### Aliases: LDscan LDmap
### Keywords: models

### ** Examples

## Not run: 
##D ## Download the VCF file from Dryad:
##D ## http://dx.doi.org/10.5061/dryad.446sv.2
##D 
##D ## the VCF file should have this name:
##D fl <- "global.pop.GATK.SNP.hard.filters.V3.phased_all.pop.maf.05.recode.vcf.gz"
##D 
##D info.fly <- VCFloci(fl)
##D 
##D bks <- seq(0, 1, 0.2)
##D 
##D ## LD map from the first 100 loci:
##D x <- read.vcf(fl, to = 100) # read only 100 loci
##D res <- LDscan(x)
##D LDmap(res, info.fly$POS[1:100], bks, scale.legend = 3)
##D 
##D ## check the chromosomes:
##D table(info.fly$CHROM)
##D 
##D ## LD map from 100 loci randomly distributed on the chromosome:
##D s <- ceiling(seq(1, 224253, length.out = 100))
##D xs <- read.vcf(fl, which.loci = s)
##D res2 <- LDscan(xs)
##D LDmap(res2, info.fly$POS[s], bks, scale.legend = 3)
##D 
##D ## something simpler with 10 loci:
##D x10 <- x[, 1:10]
##D ## the VCF file has no locus IDs, so we give some here:
##D names(x10) <- paste0("Loc", 1:10)
##D res10 <- LDscan(x10, quiet = TRUE)
##D LDmap(res10, angle = 45, border = NULL)
## End(Not run)



