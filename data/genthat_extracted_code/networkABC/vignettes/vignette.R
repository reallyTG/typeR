## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----message=FALSE-------------------------------------------------------
library(networkABC)

## ---- cache=TRUE---------------------------------------------------------
net<-network_gen(100,0.33)

## ---- messages=FALSE, fig.width=8, fig.height=8--------------------------
require(network)
plot(network(net$network))

## ------------------------------------------------------------------------
require(PCIT)
f<-function(a){
  a<-a[!is.nan(a)]
}

## ---- cache=TRUE---------------------------------------------------------
set.seed(1234)
clco<-rep(0,500)
for(i in 1:500){
  N<-network_gen(500,.33)$net
  N<-N+t(N)
  clco[i]<-mean(f(abs(PCIT::clusteringCoefficient(N))))
}

## ------------------------------------------------------------------------
mean(clco)

## ------------------------------------------------------------------------
sd(clco)

## ---- message=FALSE, fig.width=8, fig.height=8---------------------------
ggplot2::qplot(clco)

## ---- cache=TRUE---------------------------------------------------------
set.seed(123)
M<-matrix(rnorm(30),10,3)
result<-abc(data=M)

## ---- fig.width=8, fig.height=8------------------------------------------
networkABC::showHp(result)

## ---- fig.width=8, fig.height=8------------------------------------------
showNp(result)

## ---- fig.width=8, fig.height=8------------------------------------------
showNetwork(result,0.3)

## ---- fig.width=8, fig.height=8------------------------------------------
hist(result$dist)

## ---- eval=FALSE---------------------------------------------------------
#  result<-abc(data=M,
#              clust_coeffs=0.33, #you can specify more than one clustering coefficient
#              tolerance=3.5, #maximal distance between simulated and real data
#              # to accept the network
#              number_hubs=3,#the number of hubs
#              iterations=10, #number of iterations
#              number_networks=1000000,#number of network simulated at each iteration
#              hub_probs=NA,#specify the a priori probabilty for each gene to be a hub
#              neighbour_probs=NA,#specify the a priori probability for each couple
#              #of gene to be linked
#              is_probs=1)#set this last option to one.

