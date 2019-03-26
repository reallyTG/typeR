library(onemap)


### Name: vcf2raw
### Title: Convert variants from a VCF file to OneMap file format
### Aliases: vcf2raw
### Keywords: IO

### ** Examples


  ## Not run: 
##D     vcf2raw(input="your_VCF_file.vcf.gz",
##D             output="your_OneMap_file.raw",
##D             cross="your_cross_type",
##D             parent1=c("PAR1_sample1", "PAR1_sample2"),
##D             parent2=c("PAR2_sample1", "PAR2_sample2", "PAR2_sample3"),
##D             min_class=0.5) # for parent1, a single heterozygote replicate results
##D                            # in a heterozygote genotype call; for parent2, at
##D                            # least two samples have to be concordant
##D   
## End(Not run)




