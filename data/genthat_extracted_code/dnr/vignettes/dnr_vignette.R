## ----setup, include=FALSE, cache=FALSE--------------------------------------------------
library(knitr)
# set global chunk options
knitr::opts_chunk$set(fig.path='figure/Vignette-', fig.align='center', fig.show='hold',
                      fig.width='\\linewidth',
                      out.width='\\linewidth')
options(formatR.arrow=TRUE,width=90)

## ----beach, cache=TRUE, eval=TRUE-------------------------------------------------------
suppressMessages(library(dnr))
data(beach)

## get the number of time points
length(beach)
## network size (that allows NA)
network.size.1 <- function(x){
  if(!network::is.network(x)){
    if(is.na(x)) return(0)
  } else return(network::network.size(x))
}

## get the size of networks at each time point
sapply(beach, network.size.1)

## ----beach-fig, cache=TRUE, eval=TRUE---------------------------------------------------
par(mfrow = c(2,2))
binaryPlot(beach[[1]][, ], title = "Time point 1")
binaryPlot(beach[[10]][, ], title = "Time point 10")
binaryPlot(beach[[20]][, ], title = "Time point 20")
binaryPlot(beach[[31]][, ], title = "Time point 31")

## ----beach-vertex-model, cache=TRUE, eval=TRUE------------------------------------------
nvertexstats <- 9
maxLag = 3
VertexLag = rep(1, maxLag)
VertexLagMatrix1 <- matrix(1, maxLag, nvertexstats)
VertexLagMatrix1

## ----beach-vertex-weekend, cache=TRUE, eval=TRUE----------------------------------------
getWeekend <- function(z){
    weekends <- c("Saturday", "Sunday")
    if(!network::is.network(z)){
        if(is.na(z)) return(NA)
    } else {
         zDay <- get.network.attribute(z, attrname = "day")
         out <- ifelse(zDay %in% weekends, 1, 0)
         return(out)   
    }
}

## for(i in 1:31) print(getWeekend(beach[[i]]))
## generate a vector of network level exogenous variable
dayClass <- numeric(length(beach))
for(i in seq_along(dayClass)) {
    dayClass[i] <- getWeekend(beach[[i]])
}

## ----beach-vertex-model-fit, cache=TRUE, eval=TRUE--------------------------------------
out <- paramVertexOnly(InputNetwork = beach,
                       maxLag = 3,
                       VertexStatsvec = rep(1, nvertexstats),
                       VertexLag = rep(1, maxLag),
                       VertexLagMatrix = VertexLagMatrix1,
                       dayClass = dayClass)
summary(out$VertexFit$fit)

## ----beach-vertex-refit, cache=TRUE, eval=TRUE------------------------------------------
VertexLagMatrix <- matrix(0, maxLag, nvertexstats)
VertexLagMatrix[, c(4, 7)] <- 1
VertexLagMatrix[c(2,3),7] <- 0
VertexLagMatrix
out <- paramVertexOnly(InputNetwork = beach,
                       maxLag = 3,
                       VertexStatsvec = rep(1, nvertexstats),
                       VertexLag = rep(1, maxLag),
                       VertexLagMatrix = VertexLagMatrix,
                       dayClass = dayClass)
summary(out$VertexFit$fit)

## ----beach-edge-vertex, cache=TRUE, eval=TRUE-------------------------------------------
out <- paramVertex(InputNetwork = beach,
                   maxLag = 3,
                   VertexStatsvec = rep(1, nvertexstats),
                   VertexModelGroup = "regular",
                   VertexLag = rep(1, maxLag),
                   VertexLagMatrix = VertexLagMatrix,
                   dayClass = dayClass,
                   EdgeModelTerms = NA,
                   EdgeModelFormula = NA,
                   EdgeGroup = NA,
                   EdgeIntercept = c("edges"),
                   EdgeNetparam = c("logSize"),
                   EdgeExvar = NA,
                   EdgeLag = c(1, 1, 0),
                   paramout = TRUE)
summary(out$VertexFit$fit)
summary(out$EdgeFit$fit)

## ----sim-beach, cache=TRUE, eval=TRUE---------------------------------------------------
suppressWarnings(simResult <- engineVertex(InputNetwork = beach,
                          numSim = 3,
                          maxLag = 3,
                          VertexStatsvec = rep(1, nvertexstats),
                          VertexModelGroup = "regular",
                          VertexAttLag = rep(1, maxLag),
                          VertexLag = rep(1, maxLag),
                          VertexLagMatrix = VertexLagMatrix,
                          dayClassObserved = dayClass,
                          dayClassFuture = c(1, 0, 0, 0, 0),
                          EdgeModelTerms = NA,
                          EdgeModelFormula = NA,
                          EdgeGroup = NA,
                          EdgeIntercept = c("edges"),
                          EdgeNetparam = c("logSize"),
                          EdgeExvar = NA,
                          EdgeLag = c(0, 1, 0),
                          paramout = TRUE
                          ))
par(mfrow = c(2,2))
binaryPlot(beach[[31]][, ], title = "Time point 31")
binaryPlot(simResult$SimNetwork[[1]][, ], title = "Time point 32 (simulated)")
binaryPlot(simResult$SimNetwork[[2]][, ], title = "Time point 33 (simulated)")
binaryPlot(simResult$SimNetwork[[3]][, ], title = "Time point 34 (simulated)")

## ----blog-data, cache=TRUE, eval=TRUE---------------------------------------------------
data(rdNets)
length(rdNets)
rdNets[[1]]
plot(rdNets[[1]])

## ----blog-model, cache=TRUE, eval=TRUE--------------------------------------------------
input_network=rdNets[1:6]
model.terms=c("triadcensus.003", "triadcensus.012", "triadcensus.102", "triadcensus.021D", "gwesp");
model.formula = net~triadcensus(0:3)+gwesp(decay=0, fixed=FALSE, cutoff=30)-1;
graph_mode='digraph';
group='dnc';
alpha.glmnet=1
directed=TRUE;
method <- 'bayesglm'
maxlag <- 3
lambda=NA
intercept = c("edges")
cdim <- length(model.terms)
lagmat <- matrix(sample(c(0,1),(maxlag+1)*cdim,replace = TRUE),ncol = cdim)
ylag <- rep(1,maxlag)
exvar <- NA
out <- suppressWarnings(paramEdge(input_network,
                                  model.terms,
                                  model.formula,
                                  graph_mode='digraph',
                                  group,intercept = c("edges"),exvar=NA,
                                  maxlag = 3,
                                  lagmat = matrix(sample(c(0,1),(maxlag+1)*cdim,
                                                         replace = TRUE),ncol = cdim),
                                  ylag = rep(1,maxlag),
                                  lambda = NA, method='bayesglm',
                                  alpha.glmnet=1))
out$coef

## ----sim-blog, cache=TRUE, eval=TRUE----------------------------------------------------
input_network=rdNets[1:6]
model.terms=c("triadcensus.003", "triadcensus.012",
              "triadcensus.102", "triadcensus.021D", "gwesp")
model.formula = net~triadcensus(0:3)+gwesp(decay = 0, fixed=FALSE, cutoff=30)-1
graph_mode='digraph'
group='dnc'
alpha.glmnet=1
directed=TRUE
method <- 'bayesglm'
maxlag <- 3
lambda=NA
intercept = c("edges")
cdim <- length(model.terms)
lagmat <- matrix(sample(c(0,1),(maxlag+1)*cdim,replace = TRUE),ncol = cdim)
ylag <- rep(1,maxlag)
lagmat[1,] <- rep(0,ncol(lagmat))
out <- suppressWarnings(paramEdge(input_network,model.terms, model.formula,
                graph_mode="digraph",group,intercept = c("edges"),exvar=NA,
                maxlag = 3,
                lagmat = lagmat,
                ylag = rep(1,maxlag),
                lambda = NA, method='bayesglm',
                alpha.glmnet=1))
#

start_network <- input_network
inputcoeff <- out$coef$coef
nvertex <- 47
ns <- 10
exvar <- NA
input_network <- rdNets[1:6]
maxlag <- 3
start_network <- input_network
inputcoeff <- out$coef$coef
nvertex <- 47
ns <- 10
exvar <- NA
tmp <- suppressWarnings(engineEdge(start_network=start_network,inputcoeff=inputcoeff,ns=ns,
                     model.terms=model.terms, model.formula=model.formula,
                     graph_mode=graph_mode,group=group,intercept=intercept,
                     exvar=exvar,
                     maxlag=maxlag,
                     lagmat=lagmat,
                     ylag=ylag,
                     lambda = NA, method='bayesglm',
                     alpha.glmnet=alpha.glmnet))
par(mfrow = c(2,2))
binaryPlot(input_network[[1]][, ], title = "Time point 6", axlabs = FALSE)
binaryPlot(tmp$out_network[[1]][, ], title = "Time point 7 (simulated)", axlabs = FALSE)
binaryPlot(tmp$out_network[[2]][, ], title = "Time point 8 (simulated)", axlabs = FALSE)
binaryPlot(tmp$out_network[[3]][, ], title = "Time point 9 (simulated)", axlabs = FALSE)

## ----param-ts, cache=TRUE, eval=TRUE----------------------------------------------------
plot.ts(tmp$coefmat[, 1:10], xy.labels=FALSE,
        main = "Estimated parameters from simulated networks", cex = 0.8)

## ----comparison-metrics, cache=TRUE, eval=TRUE------------------------------------------
perfMetrics <- 
    cbind(c(sapply(tmp$out_network, function(net) ntriangles(net[, ])),
            sapply(input_network, function(net) ntriangles(net[, ]))),
          c(sapply(tmp$out_network, function(net) clustCoef(net[, ])),
            sapply(input_network, function(net) clustCoef(net[, ]))),
          c(sapply(tmp$out_network, function(net) expdeg(net[, ])),
            sapply(input_network, function(net) expdeg(net[, ]))))
colnames(perfMetrics) <- c("Triangles", "ClustCoefs", "ExpDeg")
perfMetrics <- data.frame(perfMetrics, row.names = NULL)
knitr::kable(perfMetrics, digits = 3,
             caption ="Performance metrics for input and simulated networks.")

