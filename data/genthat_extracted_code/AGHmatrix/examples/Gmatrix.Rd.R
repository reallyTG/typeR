library(AGHmatrix)


### Name: Gmatrix
### Title: Construction of Relationship Matrix G
### Aliases: Gmatrix

### ** Examples

## No test: 
## Diploid Example
data(snp.pine)
#Verifying if data is coded as 0,1,2 and missing value.
str(snp.pine)
#Build G matrices
Gmatrix.Yang <- Gmatrix(snp.pine, method="Yang", missingValue=-9, maf=0.05)
Gmatrix.VanRaden <- Gmatrix(snp.pine, method="VanRaden", missingValue=-9, maf=0.05)
Gmatrix.Su <- Gmatrix(snp.pine, method="Su", missingValue=-9, maf=0.05)
Gmatrix.Vitezica <- Gmatrix(snp.pine, method="Vitezica", missingValue=-9, maf=0.05)

## Autetraploid example
#Generating fake data
inds <- 10
markers <- 100
markersdata <- matrix(sample(x=0:4, size=inds*markers, replace=TRUE), nrow=inds, ncol=markers)

#Build G matrices
Gmatrix.VanRaden <- Gmatrix(markersdata, method="VanRaden", ploidy=4)
Gmatrix.Endelman <- Gmatrix(markersdata, method="Endelman", ploidy=4) 
Gmatrix.Slater <- Gmatrix(markersdata, method="Slater", ploidy=4)
Gmatrix.Pseudodiploid <- Gmatrix(markersdata, method="VanRaden", ploidy=4, pseudo.diploid=TRUE) 
## End(No test)




