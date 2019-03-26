library(sequoia)


### Name: GenoConvert
### Title: Convert genotype file
### Aliases: GenoConvert

### ** Examples

## Not run: 
##D # Requires PLINK installed & in system PATH:
##D 
##D # tinker with window size, window overlap and VIF to get a set of
##D # 400 - 800 markers (100-200 enough for just parentage):
##D system("cmd", input = "plink --file mydata --indep 50 5 2")
##D 
##D system("cmd", input = "plink --file mydata --extract plink.prune.in
##D   --recodeA --out PlinkOUT")
##D 
##D GenoM <- GenoConvert(InFile = "PlinkOUT.raw")
## End(Not run)




