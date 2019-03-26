library(GDINA)


### Name: plot.Qval
### Title: Mesa plot for Q-matrix validation
### Aliases: plot.Qval

### ** Examples

## Not run: 
##D dat <- sim10GDINA$simdat
##D Q <- sim10GDINA$simQ
##D Q[1,] <- c(0,1,0)
##D mod1 <- GDINA(dat = dat, Q = Q, model = "GDINA")
##D out <- Qval(mod1,eps = 0.9)
##D item <- c(1,2,10)
##D plot(out,item=item,data.label=FALSE,type="all")
##D plot(out,item=10,type="best",eps=0.95)
##D plot(out,item=10,type="all",no.qvector=6)
## End(Not run)




