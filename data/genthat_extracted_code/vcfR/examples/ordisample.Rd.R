library(vcfR)


### Name: ordisample
### Title: Ordinate a sample's data
### Aliases: ordisample

### ** Examples

## Not run: 
##D 
##D # Example of normally distributed, random data.
##D set.seed(9)
##D x1 <- rnorm(500)
##D set.seed(99)
##D y1 <- rnorm(500)
##D plot(x1, y1, pch=20, col="#8B451388", main="Normal, random, bivariate data")
##D 
##D data(vcfR_example)
##D ordisample(vcf[1:100,], sample = "P17777us22")
##D 
##D vars <- 1:100
##D myOrd <- ordisample(vcf[vars,], sample = "P17777us22", plot = FALSE)
##D names(myOrd)
##D plot(myOrd$metaMDS, type = "n")
##D points(myOrd$metaMDS, display = "sites", pch=20, col="#8B451366")
##D text(myOrd$metaMDS, display = "spec", col="blue")
##D plot(myOrd$envfit, col = "#008000", add = TRUE)
##D head(myOrd$metaMDS$points)
##D myOrd$envfit
##D pairs(myOrd$data1)
##D 
##D # Seperate heterozygotes and homozygotes.
##D gt <- extract.gt(vcf)
##D hets <- is_het(gt, na_is_false = FALSE)
##D vcfhe <- vcf
##D vcfhe@gt[,-1][ !hets & !is.na(hets)  ] <- NA
##D vcfho <- vcf
##D vcfho@gt[,-1][ hets & !is.na(hets) ] <- NA
##D 
##D myOrdhe <- ordisample(vcfhe[vars,], sample = "P17777us22", plot = FALSE)
##D myOrdho <- ordisample(vcfho[vars,], sample = "P17777us22", plot = FALSE)
##D pairs(myOrdhe$data1)
##D pairs(myOrdho$data1)
##D hist(myOrdho$data1$PL, breaks = seq(0,9000, by=100), col="#8B4513")
## End(Not run)





