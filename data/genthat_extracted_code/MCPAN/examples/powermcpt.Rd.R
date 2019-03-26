library(MCPAN)


### Name: powermcpt
### Title: Testversion. Power calculation for multiple contrast tests
###   (1-way ANOVA model)
### Aliases: powermcpt
### Keywords: htest

### ** Examples

powermcpt(mu=c(3,3,5,7), n=c(10,10,10,10), sd=2, type = "Dunnett",
 alternative ="greater", ptype = "global")
powermcpt(mu=c(3,3,5,7), n=c(10,10,10,10), sd=2, type = "Williams",
 alternative ="greater", ptype = "global")

powermcpt(mu=c(3,3,5,7), n=c(10,10,10,10), sd=2, type = "Dunnett",
 alternative ="greater", ptype = "anypair")
powermcpt(mu=c(3,3,5,7), n=c(10,10,10,10), sd=2, type = "Williams",
 alternative ="greater", ptype = "anypair")

powermcpt(mu=c(3,4,5,7), n=c(10,10,10,10), sd=2, type = "Dunnett",
 alternative ="greater", ptype = "allpair")
powermcpt(mu=c(3,2,1,-1), n=c(10,10,10,10), sd=2, type = "Dunnett",
 alternative ="greater", ptype = "allpair")



