library(DoE.base)


### Name: utilities
### Title: Utility functions for DoE packages, not intended for direct use
### Aliases: make.formulas make.generators des.recode Letters printBy
###   gen.fun generators generators.default generators.design
###   generators.catlg PFTs.from.variants matrix.fromPFTs rankPFT bestPFT
###   rect_simplex HouseholderRotToOne
### Keywords: array design internal

### ** Examples

## default factor names for most design generating functions 
## (some quantitative designs have other default factor names)
## for up to 50 factors
Letters
## Not run: 
##D generators("7-2.2")
##D generators(catlg[2:8])
##D generators(FrF2(16,7))
##D generators(FrF2(16,5,blocks=4,alias.block.2fi=TRUE))
##D generators(FrF2(16,5,WPs=4,nfac.WP=2))
## End(Not run)
## column selections from L18 with one 2-level and six 3-level factors
v <- rbind(1:7, c(1:6,8), c(1:5,7:8), c(1:4,6:8), c(1:3,5:8), c(1:2,4:8), c(1,3:8))
## RPFTs
RPFTs <- DoE.base:::PFTs.from.variants(L18, v, rela=TRUE)
rpfts <- DoE.base:::matrix.fromPFTs(RPFTs)
rpfts
DoE.base:::rankPFT(rpfts)
DoE.base:::bestPFT(rpfts)



