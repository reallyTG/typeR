library(rpf)


### Name: sumScoreEAP
### Title: Compute the sum-score EAP table
### Aliases: sumScoreEAP

### ** Examples

# see Thissen, Pommerich, Billeaud, & Williams (1995, Table 2)
 spec <- list()
 spec[1:3] <- rpf.grm(outcomes=4)
 
 param <- matrix(c(1.87, .65, 1.97, 3.14,
                   2.66, .12, 1.57, 2.69,
                   1.24, .08, 2.03, 4.3), nrow=4)
 # fix parameterization
 param <- apply(param, 2, function(p) c(p[1], p[2:4] * -p[1]))
 
 grp <- list(spec=spec, mean=0, cov=matrix(1,1,1), param=param)
 sumScoreEAP(grp)



