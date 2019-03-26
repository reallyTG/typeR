library(egoTERGM)


### Name: ego_ergm
### Title: Estimation of ego-Exponential Random Graph Model (ego-ERGM)
###   using Expectation Maximization (EM) as per Salter-Townshend and
###   Murphy (2015).
### Aliases: ego_ergm
### Keywords: ego-ERGM

### ** Examples

## No test: 
# Code from xergm.common and their preparation of the Knecht network
library(xergm.common)
set.seed(1)

data("knecht")

for (i in 1:length(friendship)) {
 rownames(friendship[[i]]) <- paste("Student.", 1:nrow(friendship[[i]]), sep="")
 colnames(friendship[[i]]) <- paste("Student.", 1:nrow(friendship[[i]]), sep="")
}
rownames(primary) <- rownames(friendship[[1]])
colnames(primary) <- colnames(friendship[[1]])
sex <- demographics$sex
names(sex) <- rownames(friendship[[1]])
# step 2: imputation of NAs and removal of absent nodes:
friendship <- xergm.common::handleMissings(friendship, na = 10, method = "remove")
friendship <- xergm.common::handleMissings(friendship, na = NA, method = "fillmode")
# step 3: add nodal covariates to the networks
for (i in 1:length(friendship)) {
  s <- xergm.common::adjust(sex, friendship[[i]])
  friendship[[i]] <- network::network(friendship[[i]])
  friendship[[i]] <- network::set.vertex.attribute(friendship[[i]], "sex", s)
  idegsqrt <- sqrt(sna::degree(friendship[[i]], cmode = "indegree"))
  friendship[[i]] <- network::set.vertex.attribute(friendship[[i]],
                                                   "idegsqrt", idegsqrt)
  odegsqrt <- sqrt(sna::degree(friendship[[i]], cmode = "outdegree"))
  friendship[[i]] <- network::set.vertex.attribute(friendship[[i]],
                                                   "odegsqrt", odegsqrt)
}
sapply(friendship, network::network.size)
net <- friendship
rm(list=setdiff(ls(), "net"))

# Reduce down to first time-step
ego_ergm_fit <- ego_ergm(net = net[[1]],
                          form = c("edges", "mutual", "triangle",
                                   "nodeicov('idegsqrt')", "nodeocov('odegsqrt')",
                                   "nodematch('sex')"),
                          core_size = 1,
                          min_size = 5,
                          roles = 3,
                          forking = FALSE,
                          ncpus = 1,
                          directed = TRUE,
                          edge_covariates = FALSE,
                          seed = 12345,
                          steps = 50,
                          tol = 1e-06)
## End(No test)



