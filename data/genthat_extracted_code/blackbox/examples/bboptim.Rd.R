library(blackbox)


### Name: bboptim
### Title: Black-box function optimization
### Aliases: bboptim rbb
### Keywords: optimize

### ** Examples

# Classical toy example with optional noise
fr <- function(v,sd) {   ## Rosenbrock Banana function 
  10 * (v["y"] - v["x"]^2)^2 + (1 - v["x"])^2 + rnorm(1,sd=sd)
}
set.seed(123)

# Initial parameter values, including duplicates. See ?init_grid.
parsp <- init_grid(lower=c(x=0,y=0),upper=c(x=2,y=2),nUnique=25)

#### Without noise
# add function values
simuls <- cbind(parsp,bb=apply(parsp,1,"fr",sd=0))

# optimization
bbresu <- bboptim(simuls)
print(bbresu)

# refine with additional points
if (blackbox.getOption("example_maxtime")>4) {
 while ( any( ! bbresu$conv_crits) ) {
  print(unlist(bbresu$optr[c("par","value")]))
  candidates <- rbb(bbresu)
  newsimuls <- cbind(candidates,bb=apply(candidates,1,"fr",sd=0))
  bbresu <- bboptim(rbind(bbresu$fit$data,newsimuls))
 }
 print(bbresu)
}

#### With noise

if (blackbox.getOption("example_maxtime")>78) {
 set.seed(123)
 simuls <- cbind(parsp,bb=apply(parsp,1,"fr",sd=0.1))

 bbresu <- bboptim(simuls, precision=0.02)
 
 while ( any( ! bbresu$conv_crits) ) {
  print(unlist(bbresu$optr[c("par","value")]))
  candidates <- rbb(bbresu)
  newsimuls <- cbind(candidates,bb=apply(candidates,1,"fr",sd=0.1))
  bbresu <- bboptim(rbind(bbresu$fit$data,newsimuls), precision=0.02)
 }
 print(bbresu)
}

# basic plot
## Not run: 
##D require(spaMM)
##D opt <- bbresu$optr$par
##D mapMM(bbresu$fit, decorations=points(opt[1],opt[2],cex=2,pch="+"))
## End(Not run)



