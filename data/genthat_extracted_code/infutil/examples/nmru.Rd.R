library(infutil)


### Name: nmru
### Title: Normalized Minimum Reduction in Uncertainty
### Aliases: nmru
### Keywords: models

### ** Examples

# five items
ltm.lsat <- ltm(LSAT~z1, IRT=FALSE)

nmru(ltm.lsat)
nmru(ltm.lsat, range.int=c(-20,20))

# seven items
ltm.lsat <- ltm(cbind(LSAT, LSAT[,1:2])~z1, IRT=FALSE)

nmru(ltm.lsat)

# ten items
ltm.lsat <- ltm(cbind(LSAT, LSAT)~z1, IRT=FALSE)

nmru(ltm.lsat)





