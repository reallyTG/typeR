library(gee4)


### Name: geer
### Title: Fit GEE-MCD and WGEE-MCD models
### Aliases: geer

### ** Examples

fitgee.normal <- geer(cd4 | id | time ~ 1 | 1, data = aids, triple
  = c(6,3,3), method = 'gee-mcd', corr.struct = 'id', control =
  geerControl(trace=TRUE))



