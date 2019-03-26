library(FrF2)


### Name: CatalogueAccessors
### Title: Catalogue file and accessor functions
### Aliases: [.catlg print.catlg res nruns nfac WLP nclear.2fis clear.2fis
###   dominating res.catlg nruns.catlg nfac.catlg WLP.catlg
###   nclear.2fis.catlg clear.2fis.catlg all.2fis.clear.catlg
###   dominating.catlg catlg block.catlg
### Keywords: array design

### ** Examples

c8 <- catlg[nruns(catlg)==8]
nclear.2fis(c8)
clear.2fis(c8)
all.2fis.clear.catlg(c8)

## usage of print function for inspecting catalogued designs
## the first 10 resolution V+ designs in catalogue catlg
print(catlg, res.min=5)
## the 10 resolution V+ designs in catalogue catlg with the most factors
## (for more than one possible value of nfactors, MaxC2 does usually not make sense)
print(catlg, res.min=5, MaxC2=TRUE)

## designs with 12 factors in 64 runs (minimum resolution IV because 
## no resolution III designs of this size are in the catalogue)
## best 10 aberration designs
print(catlg, nfactors=12, nruns=64)
## best 10 clear 2fi designs
print(catlg, nfactors=12, nruns=64, MaxC2=TRUE)
## show alias structure
print(catlg, nfactors=12, nruns=64, MaxC2=TRUE, show.alias=TRUE)
## show best 20 designs
print(catlg, nfactors=12, nruns=64, MaxC2=TRUE, show=20)

## use vector-valued nruns 
print(catlg, nfactors=7, nruns=c(16,32))
## all designs (as show=100 is larger than available number of designs)
##    with 7 or 8 factors in 16 runs
print(catlg, nfactors=c(7,8), nruns=16, show=100)

## the irregular resolution V arrays from package DoE.base (from version 0.9-17)
## designs can be created from them using function oa.design
## Not run: 
##D ## not run in case older version of DoE.base does not have these
##D length3(L128.2.15.8.1)
##D length4(L128.2.15.8.1)  ## aliasing of 2fis with block factor
##D length4(L128.2.15.8.1[,-16])
##D 
##D length3(L256.2.19)
##D length4(L256.2.19)
##D 
##D ##length3(L2048.2.63) 
##D ##length4(L2048.2.63) do not work resource wise
##D ## but the array is also resolution V (but irregular)
## End(Not run)



