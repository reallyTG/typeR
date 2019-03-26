library(fat2Lpoly)


### Name: fat2Lpoly.withinR
### Title: Two-locus Family-based Association Test with Polytomous Outcome
###   (all arguments within R)
### Aliases: fat2Lpoly.withinR

### ** Examples

data(ped.x.all)

## Not run: 
##D snp.names.mat=cbind(rep("snp4.loc1",2),c("snp3.loc2","snp4.loc2"))	
##D microsat.names.mat=cbind(rep("1_4_mrk:",2),c("2_3_mrk:","2_4_mrk:"))	
##D fat2Lpoly.allSNPs=fat2Lpoly.withinR(ped.x.all,snp.names.mat,ibd.loci=
##D                             microsat.names.mat,contingency.file=TRUE,
##D 							design.constraint=design.endo2disease,
##D 							lc=1)
##D 
##D joint.tests=list(c(2,5))   
##D get.scores.pvalues(fat2Lpoly.allSNPs,joint.tests)
## End(Not run)



