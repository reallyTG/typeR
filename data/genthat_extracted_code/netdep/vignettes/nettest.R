## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message = FALSE, warning = FALSE-----------------------------------
library(knitr)
library(netdep)
library(MASS)
library(mvrtn)
library(igraph)
library(igraphdata)
# generate network
G = latent.netdep(n.node = 200, rho = 0.2, dep.factor = -1)
A = as.matrix(get.adjacency(G))
outcomes = peer.process(A, max.time = 3, mprob = 0.6, epsilon = 0.1)
names(outcomes)

## ------------------------------------------------------------------------
result0 = make.permute.moran(A, outcomes$time0, np = 100)
result1 = make.permute.moran(A, outcomes$time1, np = 100)
result2 = make.permute.moran(A, outcomes$time2, np = 100)
result3 = make.permute.moran(A, outcomes$time3, np = 100)

## ------------------------------------------------------------------------
kable(cbind( c("t=0", "t=1", "t=2", "t=3"),
  round(c(result0$moran, result1$moran, result2$moran, result3$moran),2),
  round(c(result0$pval.permute, result1$pval.permute, result2$pval.permute, result3$pval.permute),2)), row.names = NA, col.names = c("Transmission time", "Moran's I", "P-value (permutation)"), 
      caption = "Direct transmission")

## ------------------------------------------------------------------------
G = latent.netdep(n.node = 200, rho = 0.4, dep.factor = -1)
subG = snowball.sampling(G, 100)$subG
A = as.matrix(get.adjacency(subG))
conti.Y = V(subG)$outcome 
cate.Y = ifelse(conti.Y < quantile(conti.Y, 0.25), 1, 4)
cate.Y = ifelse(conti.Y < quantile(conti.Y, 0.60) & conti.Y >= quantile(conti.Y, 0.25), 2, cate.Y)
cate.Y = ifelse(conti.Y < quantile(conti.Y, 0.80) & conti.Y >= quantile(conti.Y, 0.60), 3, cate.Y)
table(cate.Y)
result = make.permute.Phi(A, cate.Y, 100)
print(result$phi)
print(result$pval.permute)

## ------------------------------------------------------------------------
library(igraphdata)
data(karate)
A = as.matrix(as_adjacency_matrix(karate, attr= "weight", sparse = T)) # weighted adjacency matrix
Y = V(karate)$Faction
table(Y) # binary
result.moran = make.permute.moran(A, Y, np = 100)
print(result.moran$moran)
print(result.moran$pval.permute)
result.phi = make.permute.Phi(A, Y, np = 100)
print(result.phi$phi)
print(result.phi$pval.permute)

## ------------------------------------------------------------------------
data(UKfaculty)
A = as.matrix(as_adjacency_matrix(UKfaculty, attr= "weight", sparse = T)) # weighted adjacency matrix
Y = V(UKfaculty)$Group
table(Y)
result = make.permute.Phi(A, Y, np = 50)
print(result$phi)
print(result$pval.permute)

