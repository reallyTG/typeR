library(gap)


### Name: hwe
### Title: Hardy-Weinberg equlibrium test for a multiallelic marker
### Aliases: hwe
### Keywords: htest

### ** Examples

## Not run: 
##D a <- c(3,2,2)
##D a.out <- hwe(a,data.type="genotype")
##D a.out
##D a.out <- hwe(a,data.type="count")
##D a.out
##D require(haplo.stats)
##D data(hla)
##D hla.DQR <- hwe(hla[,3:4])
##D summary(hla.DQR)
##D # multiple markers
##D s <- vector()
##D for(i in seq(3,8,2))
##D {
##D   hwe_i <- hwe(hla[,i:(i+1)])
##D   s <- rbind(s,hwe_i)
##D }
##D s
## End(Not run)



