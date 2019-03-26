library(gap)


### Name: genecounting
### Title: Gene counting for haplotype analysis
### Aliases: genecounting
### Keywords: models

### ** Examples

## Not run: 
##D # HLA data
##D data(hla)
##D hla.gc <- genecounting(hla[,3:8])
##D summary(hla.gc)
##D hla.gc$l0
##D hla.gc$l1
##D 
##D # ALDH2 data
##D data(aldh2)
##D control <- gc.control(handle.miss=1,assignment="ALDH2.out")
##D aldh2.gc <- genecounting(aldh2[,3:6],control=control)
##D summary(aldh2.gc)
##D aldh2.gc$l0
##D aldh2.gc$l1
##D 
##D # Chromosome X data
##D # assuming allelic data have been extracted in columns 3-13
##D # and column 3 is sex
##D filespec <- system.file("tests/genecounting/mao.dat")
##D mao2 <- read.table(filespec)
##D dat <- mao2[,3:13]
##D loci <- c(12,9,6,5,3)
##D contr <- gc.control(xdata=TRUE,handle.miss=1)
##D mao.gc <- genecounting(dat,loci=loci,control=contr)
##D mao.gc$npusr
##D mao.gc$npdat
## End(Not run)



