library(GDINA)


### Name: dif
### Title: Differential item functioning for cognitive diagnosis models
### Aliases: dif summary.dif

### ** Examples

## Not run: 
##D set.seed(123456)
##D N <- 3000
##D Q <- sim10GDINA$simQ
##D gs <- matrix(c(0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2,
##D                        0.1,0.2),ncol = 2, byrow = TRUE)
##D # By default, individuals are simulated from uniform distribution
##D # and deltas are simulated randomly
##D sim1 <- simGDINA(N,Q,gs.parm = gs,model="DINA")
##D sim2 <- simGDINA(N,Q,gs.parm = gs,model=c(rep("DINA",9),"DINO"))
##D dat <- rbind(extract(sim1,"dat"),extract(sim2,"dat"))
##D gr <- c(rep(1,N),rep(2,N))
##D dif.out <- dif(dat,Q,group=gr)
##D dif.out2 <- dif(dat,Q,group=gr,method="LR")
## End(Not run)



