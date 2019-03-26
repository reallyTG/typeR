library(SCCI)


### Name: pSCCI
### Title: Stochastic Complexity-based Conditional Independence Criterium
###   (p-value)
### Aliases: pSCCI

### ** Examples

set.seed(1)
x = round((runif(1000, min=0, max=5)))
y = round((runif(1000, min=0, max=5)))
Z = data.frame(round((runif(1000, min=0, max=5))), round((runif(1000, min=0, max=5))))
## create data matrix
data_matrix = as.matrix(data.frame(x,y,S1=Z[,1], S2=Z[,2]))
suffStat = list(dm=data_matrix)
pSCCI(x=1,y=2,S=c(3,4),suffStat=suffStat)	## 0.01000001

### Using SCI within the PC algorithm
if(require(pcalg)){
  ## Load data
  data(gmD)
  V <- colnames(gmD$x)
  ## define sufficient statistics
  suffStat <- list(dm = gmD$x, nlev = c(3,2,3,4,2), adaptDF = FALSE)
  ## estimate CPDAG
  pc.D <- pc(suffStat,
            ## independence test: SCCI using fNML
            indepTest = pSCCI, alpha = 0.01, labels = V, verbose = TRUE)
}
if (require(pcalg) & require(Rgraphviz)) {
  ## show estimated CPDAG
  par(mfrow = c(1,2))
  plot(pc.D, main = "Estimated CPDAG")
  plot(gmD$g, main = "True DAG")
}



