## ----include=FALSE-------------------------------------------------------
library(knitr)
opts_chunk$set(
concordance=TRUE,
prompt=TRUE,
error=TRUE,
comment=""
)

## ----echo=FALSE,include=FALSE--------------------------------------------
library(bnstruct)

## ----citation2,eval=FALSE------------------------------------------------
#  citation("bnstruct")

## ----installcran,eval=FALSE----------------------------------------------
#  install.packages("bnstruct")

## ----bndataset.constructor, eval=FALSE-----------------------------------
#  dataset.from.data <- BNDataset(data = data,
#                                 discreteness = rep('d',4),
#                                 variables = c("a", "b", "c", "d"),
#                                 node.sizes = c(4,8,12,16))
#  
#  dataset.from.file <- BNDataset("path/to/data.file",
#                                 "path/to/header.file")

## ----create.sample.datasets, eval=FALSE----------------------------------
#  asia <- BNDataset("asia_10000.data",
#                    "asia_10000.header",
#                    starts.from=0)
#  child <- BNDataset("Child_data_na_5000.data",
#                     "Child_data_na_5000.header",
#                     starts.from=0)

## ----sample.datasets.accessors,eval=FALSE--------------------------------
#  asia  <- asia()
#  child <- child()

## ----evolvingdataset,eval=FALSE------------------------------------------
#  dataset <- BNDataset("asia_2_layers.data",
#                       "asia_2_layers.header",
#                       num.time.steps=2)

## ----imputation1,eval=FALSE----------------------------------------------
#  dataset <- BNDataset(data.file   = "path/to/file.data",
#                       header.file = "path/to/file.header")
#  dataset <- impute(dataset)

## ----bootstrap1,eval=FALSE-----------------------------------------------
#  dataset <- BNDataset("path/to/file.data",
#                       "path/to/file.header")
#  dataset <- bootstrap(dataset, num.boots = 100)
#  dataset.with.imputed.samples <- bootstrap(dataset,
#                                            num.boots = 100,
#                                            imputation = TRUE)

## ----dataset.print,eval=FALSE--------------------------------------------
#  # the following are equivalent:
#  print(dataset)
#  show(dataset)
#  dataset # from inside an R session

## ----getboot,eval=FALSE--------------------------------------------------
#  # get raw samples
#  for (i in 1:num.boots(dataset))
#    print( boot(dataset, i) )

## ----getboot.1,eval=FALSE------------------------------------------------
#  # get imputed samples
#  for (i in 1:num.boots(dataset))
#    print( boot(dataset, i, use.imputed.data = TRUE) )

## ----bn2, eval=FALSE-----------------------------------------------------
#  dataset <- child()
#  net     <- BN(dataset)

## ----learn.network, eval=FALSE-------------------------------------------
#  dataset <- child()
#  net     <- learn.network(dataset)

## ----learn.network.2, eval=FALSE-----------------------------------------
#  dataset <- child()
#  net.1   <- learn.network(dataset,
#                           algo = "sem",
#                           scoring.func = "AIC")
#  dataset <- impute(dataset)
#  net.2   <- learn.network(dataset,
#                           algo = "mmhc",
#                           scoring.func = "BDeu",
#                           use.imputed.data = TRUE)

## ----learn.network.chain, eval=FALSE-------------------------------------
#  dataset <- child()
#  net.1   <- learn.network(dataset,
#                           initial.network = "random.chain",
#                           seed = 12345)
#  net.2   <- learn.network(dataset,
#                           algo = "sem",
#                           initial.network = net.1)

## ----layering,eval=F-----------------------------------------------------
#  layers <- c(1,2,3,3,3,3,3,3,4,4,4,4,4,4,4,5,5,5,5,5)
#  net.layer <- learn.network(dataset, layering = layers)

## ----learn.network.3, eval=FALSE-----------------------------------------
#  dataset <- child()
#  dataset <- bootstrap(dataset, 100, imputation = TRUE)
#  net.1   <- learn.network(dataset,
#                           algo = "mmhc",
#                           scoring.func = "AIC",
#                           bootstrap = TRUE)
#  # or, for learning from imputed data
#  net.2   <- learn.network(dataset,
#                           algo = "mmhc",
#                           scoring.func = "AIC",
#                           bootstrap = TRUE,
#                           use.imputed.data = TRUE)

## ----dbn1,eval=F---------------------------------------------------------
#  # asia_2_layers is a toy example constructed purely for testing
#  # purposes. It does not represent a real set of observations.
#  #
#  # It simulates a system with 8 nodes observed over 2 consecutive
#  # time steps, of which we know the layering in each time slot.
#  # The dataset contains therefore 16 variables observed.
#  dataset <- BNDataset("asia_2_layers.data",
#                       "asia_2_layers.header",
#                       num.time.steps = 2)
#  dbn <- learn.dynamic.network(dataset, num.time.steps = 2)

## ----dbn2,eval=F---------------------------------------------------------
#  # asia_2_layers is a toy example constructed purely for testing
#  # purposes. It does not represent a real set of observations.
#  #
#  # It simulates a system with 8 nodes observed over 2 consecutive
#  # time steps, of which we know the layering in each time slot.
#  # The dataset contains therefore 16 variables observed.
#  dataset <- BNDataset("asia_2_layers.data",
#                       "asia_2_layers.header",
#                       num.time.steps = 2)
#  dbn <- learn.network(dataset)

## ----dbn3,eval=F---------------------------------------------------------
#  # asia_2_layers is a toy example constructed purely for testing
#  # purposes. It does not represent a real set of observations.
#  #
#  # It simulates a system with 8 nodes observed over 2 consecutive
#  # time steps, of which we know the layering in each time slot.
#  # The dataset contains therefore 16 variables observed.
#  dataset <- BNDataset("asia_2_layers.data",
#                       "asia_2_layers.header",
#                       num.time.steps = 2)
#  layers <- c(1,2,2,3,3,3,3,3)
#  dbn <- learn.dynamic.network(dataset,
#                               num.time.steps = 2,
#                               layering = layers)

## ----dag1,eval=FALSE-----------------------------------------------------
#  dag(net)
#  wpdag(net)

## ----cpts2,eval=FALSE----------------------------------------------------
#  cpts(net)

## ----plotprint,eval=FALSE------------------------------------------------
#  plot(net) # regular DAG
#  plot(net, plot.wpdag=T) # wpdag

## ----plotqgraph,eval=FALSE-----------------------------------------------
#  plot(net, method="qgraph",
#            label.scale.equal=T,
#            node.width = 1.6,
#            plot.wpdag=T)

## ----show,eval=FALSE-----------------------------------------------------
#  # TFAE
#  print(net)
#  show(net)
#  net

## ----writecyto,eval=FALSE------------------------------------------------
#  write.xgmml(net)

## ----infeng1,eval=FALSE--------------------------------------------------
#  dataset <- child()
#  net     <- learn.network(dataset)
#  engine  <- InferenceEngine(net)

## ----infeng2,eval=FALSE--------------------------------------------------
#  dataset <- child()
#  net     <- learn.network(dataset)
#  
#  # suppose we have observed variable 1 taking value 2
#  # and variable 4 taking value 1:
#  obs <- list("observed.vars" = c(1,4),
#              "observed.vals" = c(2,1))
#  
#  # the following are equivalent:
#  engine  <- InferenceEngine(net, obs)
#  
#  # and
#  engine  <- InferenceEngine(net)
#  observations(engine) <- obs

## ----infeng3,eval=FALSE--------------------------------------------------
#  obs <- list("observed.vars" = c(1,4),
#              "observed.vals" = c(2,1))
#  engine  <- InferenceEngine(net)
#  engine  <- belief.propagation(engine, obs)
#  new.net <- updated.bn(engine)

## ----infeng4,eval=FALSE--------------------------------------------------
#  dataset <- child()
#  net     <- learn.network(dataset)
#  engine  <- InferenceEngine(net)
#  results <- em(engine, dataset)
#  updated.engine  <- results$InferenceEngine
#  updated.dataset <- results$BNDataset

## ----childtest,eval=FALSE,cache=FALSE------------------------------------
#  dataset <- child()
#  
#  # learning with available cases analysis, MMHC, BDeu
#  net <- learn.network(dataset)
#  plot(net)
#  
#  # learning with imputed data, MMHC, BDeu
#  imp.dataset <- impute(dataset)
#  net <- learn.network(imp.dataset, use.imputed.data = TRUE)
#  plot(net)

## ----childtest1cont1,eval=FALSE------------------------------------------
#  # SEM, BDeu using previous network as starting point
#  net <- learn.network(dataset, algo = "sem",
#                       scoring.func = "BDeu",
#                       initial.network = net,
#                       struct.threshold = 10,
#                       param.threshold = 0.001)
#  plot(net)

## ----childtest1cont2,eval=FALSE------------------------------------------
#  # we update the probabilities with EM from the raw dataset,
#  # starting from the first network
#  engine  <- InferenceEngine(net)
#  results <- em(engine, dataset)
#  updated.engine  <- results$InferenceEngine
#  updated.dataset <- results$BNDataset

## ----asiatest,eval=FALSE,cache=FALSE-------------------------------------
#  dataset <- asia()
#  dataset <- bootstrap(dataset)
#  net <- learn.network(dataset, bootstrap = TRUE)
#  
#  plot(net)

## ----naivebayes,eval=FALSE-----------------------------------------------
#  # artificial dataset generation
#  spam <- sample(c(0,1), 1000, prob=c(0.5, 0.5), replace=T)
#  buy <- sapply(spam, function(x) {
#                          if (x == 0) {
#                              sample(c(0,1),1,prob=c(0.8,0.2),replace=T)
#                          } else {
#                              sample(c(0,1),1,prob=c(0.2,0.8))}
#                      })
#  med <- sapply(spam, function(x) {
#                          if (x == 0) {
#                              sample(c(0,1),1,prob=c(0.95,0.05),replace=T)
#                          } else {
#                              sample(c(0,1),1,prob=c(0.05,0.95))}
#                      })
#  bns <- sapply(spam, function(x) {
#                          if (x == 0) {
#                              sample(c(0,1),1,prob=c(0.01,0.99),replace=T)
#                          } else {
#                              sample(c(0,1),1,prob=c(0.01,0.99))}
#                          })
#  lea <- sapply(spam, function(x) {
#                          if (x == 0) {
#                              sample(c(0,1),1,prob=c(0.05,0.95),replace=T)
#                          } else {
#                              sample(c(0,1),1,prob=c(0.95,0.05))}
#                          })
#  d <- as.matrix(cbind(spam,buy,med,bns,lea))
#  colnames(d) <- c("spam","buy","med","bnstruct","learn")
#  library(bnstruct)
#  spamdataset <- BNDataset(d, c(T,T,T,T,T),
#                           c("spam","buy","med","bnstruct","learn"),
#                           c(2,2,2,2,2), starts.from=0)
#  n <- learn.network(spamdataset,
#                     algo="mmhc",
#                     layering=c(1,2,2,2,2),
#                     layer.struct=matrix(c(0,0,1,0),
#                                         c(2,2)))
#  plot(n)

