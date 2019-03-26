library(qtl)


### Name: c.scantwoperm
### Title: Combine data from scantwo permutations
### Aliases: c.scantwoperm rbind.scantwoperm
### Keywords: manip

### ** Examples

data(fake.f2)
## Don't show: 
fake.f2 <- subset(fake.f2, chr=c(18:19,"X"), ind=1:50)
## End(Don't show)
fake.f2 <- calc.genoprob(fake.f2)
## Not run: 
##D operm1 <- scantwo(fake.f2, method="hk", n.perm=50)
##D operm2 <- scantwo(fake.f2, method="hk", n.perm=50)
## End(Not run)## Don't show: 
operm1 <- scantwo(fake.f2, method="hk", n.perm=3)
operm2 <- scantwo(fake.f2, method="hk", n.perm=3)
## End(Don't show)

operm <- c(operm1, operm2)



