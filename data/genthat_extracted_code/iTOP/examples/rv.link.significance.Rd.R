library(iTOP)


### Name: rv.link.significance
### Title: Wrapper function to determine significance in the PC algorithm
### Aliases: rv.link.significance

### ** Examples

set.seed(2)
n = 100
p = 100
x1 = matrix(rnorm(n*p), n, p)
x2 = x1 + matrix(rnorm(n*p), n, p)
x3 = x2 + matrix(rnorm(n*p), n, p)
data = list(x1=x1, x2=x2, x3=x3)
config_matrices = compute.config.matrices(data)
cors = rv.cor.matrix(config_matrices)
cors_perm = run.permutations(config_matrices, nperm=1000)

## Not run: 
##D library(pcalg)
##D suffStat = list(cors=cors, cors_perm=cors_perm)
##D pc.fit = pc(suffStat=suffStat, indepTest=rv.link.significance, labels=names(data),
##D             alpha=0.05, conservative=TRUE, solve.confl=TRUE)
##D plot(pc.fit, main="")
## End(Not run)



