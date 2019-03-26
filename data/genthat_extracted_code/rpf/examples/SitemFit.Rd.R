library(rpf)


### Name: SitemFit
### Title: Compute the S fit statistic for a set of items
### Aliases: SitemFit

### ** Examples

grp <- list(spec=list())
grp$spec[1:20] <- rpf.grm()
grp$param <- sapply(grp$spec, rpf.rparam)
colnames(grp$param) <- paste("i", 1:20, sep="")
grp$mean <- 0
grp$cov <- diag(1)
grp$free <- grp$param != 0
grp$data <- rpf.sample(500, grp=grp)
SitemFit(grp)



