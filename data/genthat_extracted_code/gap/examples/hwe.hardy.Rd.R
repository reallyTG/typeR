library(gap)


### Name: hwe.hardy
### Title: Hardy-Weinberg equilibrium test using MCMC
### Aliases: hwe.hardy
### Keywords: htest

### ** Examples

  ## Not run: 
##D     # example 2 from hwe.doc:
##D     a<-c(
##D     3,
##D     4, 2,
##D     2, 2, 2,
##D     3, 3, 2, 1,
##D     0, 1, 0, 0, 0,
##D     0, 0, 0, 0, 0, 1,
##D     0, 0, 1, 0, 0, 0, 0,
##D     0, 0, 0, 2, 1, 0, 0, 0)
##D     ex2 <- hwe.hardy(a=a,alleles=8)
##D 
##D     # example using HLA
##D     data(hla)
##D     x <- hla[,3:4]
##D     y <- pgc(x,handle.miss=0,with.id=1)
##D     n.alleles <- max(x,na.rm=TRUE)
##D     z <- vector("numeric",n.alleles*(n.alleles+1)/2)
##D     z[y$idsave] <- y$wt
##D     hwe.hardy(a=z,alleles=n.alleles)
##D 
##D     # with use of class 'genotype'
##D     # this is to be fixed
##D     library(genetics)
##D     hlagen <- genotype(a1=x$DQR.a1, a2=x$DQR.a2, 
##D                        alleles=sort(unique(c(x$DQR.a1, x$DQR.a2))))
##D     hwe.hardy(hlagen)
##D 
##D     # comparison with hwe
##D     hwe(z,data.type="count")
##D 
##D     # to create input file for HARDY
##D     print.tri<-function (xx,n) {
##D         cat(n,"\n")
##D         for(i in 1:n) {
##D             for(j in 1:i) {
##D                 cat(xx[i,j]," ")
##D             }
##D         cat("\n")
##D         }
##D         cat("100 170 1000\n")
##D     }
##D     xx<-matrix(0,n.alleles,n.alleles)
##D     xxx<-lower.tri(xx,diag=TRUE)
##D     xx[xxx]<-z
##D     sink("z.dat")
##D     print.tri(xx,n.alleles)
##D     sink()
##D     # now call as: hwe z.dat z.out
##D   
## End(Not run)



