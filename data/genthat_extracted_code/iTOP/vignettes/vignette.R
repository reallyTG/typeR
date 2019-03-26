## ------------------------------------------------------------------------
set.seed(1)
n = 100
p = 100
x1 = matrix(rnorm(n*p), n, p)
x2 = matrix(rnorm(n*p), n, p)
x3 = x1 + x2 + matrix(rnorm(n*p), n, p)
x4 = x3 + matrix(rnorm(n*p), n, p)
rownames(x1) = rownames(x2) = rownames(x3) = rownames(x4) = paste0("X",1:n)
data = list(x1=x1, x2=x2, x3=x3, x4=x4)

## ---- message=F----------------------------------------------------------
library(iTOP)
data = intersect.samples(data)
config_matrices = compute.config.matrices(data)
cors = rv.cor.matrix(config_matrices)

## ---- message=F----------------------------------------------------------
library(NMF)
aheatmap(cors)

## ------------------------------------------------------------------------
cors_perm = run.permutations(config_matrices, nperm=1000)
cors_boot = run.bootstraps(config_matrices, nboots=1000)

rv.pcor(cors, "x1", "x2")
rv.conf.interval(cors_boot, "x1", "x2")
rv.pval(cors, cors_perm, "x1", "x2")

## ------------------------------------------------------------------------
rv.pcor(cors, "x1", "x4", "x3")
rv.pval(cors, cors_perm, "x1", "x4", "x3")
rv.conf.interval(cors_boot, "x1", "x4", "x3")

## ------------------------------------------------------------------------
rv.pcor(cors, "x3", "x4", c("x1","x2"))
rv.pval(cors, cors_perm, "x3", "x4", c("x1","x2"))
rv.conf.interval(cors_boot, "x3", "x4", c("x1","x2"))

## ----eval=F--------------------------------------------------------------
#  dependencies = c("Rgraphviz", "graph", "RBGL")
#  source("https://bioconductor.org/biocLite.R")
#  for(dependency in dependencies) {
#    if(!require(dependency, character.only=T)) {
#      biocLite(dependency)
#    }
#  }
#  install.packages("pcalg")

## ---- message=F----------------------------------------------------------
library(pcalg)
suffStat = list(cors=cors, cors_perm=cors_perm)
pc.fit = pc(suffStat=suffStat, indepTest=rv.link.significance, 
            labels=names(data), alpha=0.05, conservative=T, solve.confl=T)
plot(pc.fit, main="")

## ------------------------------------------------------------------------
set.seed(1)
n = 100
p = 100
x1 = matrix(rnorm(n*p), n, p)
x2 = matrix(rnorm(n*p), n, p)
x3 = x1 + x2 + matrix(rnorm(n*p), n, p)
x4 = x3 + matrix(rnorm(n*p), n, p)
rownames(x1) = rownames(x2) = rownames(x3) = rownames(x4) = paste0("X",1:n)
data = list(x1=x1, x2=x2, x3=x3, x4=x4)
for(i in c(1,4)) {
  data[[i]] = data[[i]]>median(data[[i]])
}

## ------------------------------------------------------------------------
data = intersect.samples(data)
similarity_fun = list(jaccard, inner.product, inner.product, jaccard)
config_matrices = compute.config.matrices(data, similarity_fun=similarity_fun)

## ---- eval=F-------------------------------------------------------------
#  # this code block is not evaluated
#  config_matrices = compute.config.matrices(data)
#  config_matrices$x1 = process.custom.config.matrix(my.config.matrix.for.x1,
#                                                    center=T, mod.rv=T)

## ------------------------------------------------------------------------
cors = rv.cor.matrix(config_matrices)
cors_perm = run.permutations(config_matrices, nperm=1000)
suffStat = list(cors=cors, cors_perm=cors_perm)
pc.fit = pc(suffStat=suffStat, indepTest=rv.link.significance, 
            labels=names(data), alpha=0.05, conservative=T, solve.confl=T)
plot(pc.fit, main="")

