library(CompareCausalNetworks)


### Name: getParents
### Title: Estimate the connectivity matrix of a causal graph
### Aliases: getParents
### Keywords: Causality, Graph estimations

### ** Examples

## load the backShift package for data generation and plotting functionality
if(require(backShift) & require(pcalg)){
  # Simulate data with connectivity matrix A with assumptions
  # 1) hidden variables present
  # 2) precise location of interventions is assumed unknown
  # 3) different environments can be distinguished
  
  ## simulate data
  myseed <- 1
  
  # sample size n
  n <- 10000
  
  # p=3 predictor variables and connectivity matrix A
  p <- 3
  labels <- c("1", "2", "3")
  A <- diag(p)*0
  A[1,2] <- 0.8
  A[2,3] <- 0.8
  A[3,1] <- -0.4
  
  # divide data in 10 different environments
  G <- 10
  
  # simulate
  simResult <- backShift::simulateInterventions(n, p, A, G, intervMultiplier = 3,
               noiseMult = 1, nonGauss = TRUE, hiddenVars = TRUE,
               knownInterventions = FALSE, fracVarInt = NULL, simulateObs = TRUE,
               seed = myseed)
  X <- simResult$X
  environment <- simResult$environment
  
  ## apply all  methods given in vector 'methods'
  ## (using all data pooled for pc/LINGAM/rfci/ges -- can be changed with option
  ## 'onlyObservationalData=TRUE')
  
  methods <- c("backShift", "LINGAM") #c("pc", "rfci", "ges")
  
  # select whether you want to run stability selection
  stability <- FALSE
  
  # arrange graphical output into a rectangular grid
  sq <- ceiling(sqrt(length(methods)+1))
  par(mfrow=c(ceiling((length(methods)+1)/sq),sq))
  
  ## plot and print true graph
  cat("\n true graph is  ------  \n" )
  print(A)
  plotGraphEdgeAttr(A, plotStabSelec = FALSE, labels = labels, thres.point = 0,
   main = "TRUE GRAPH")
  
  ## loop over all methods and compute and print/plot estimate
  for (method in methods){
    cat("\n result for method", method,"  ------  \n" )
  
    if(!stability){
      # Option 1): use this estimator as a point estimate
      Ahat <- getParents(X, environment, method=method, alpha=0.1, pointConf = TRUE)
    }else{
      # Option 2): use a stability selection based estimator
      # with expected number of false positives bounded by EV=2
      Ahat <- getParentsStable(X, environment, EV=2, method=method, alpha=0.1)
    }
  
   # print and plot estimate (point estimate thresholded if numerical estimates
   # are returned)
    print(Ahat)
    if(!stability)
      plotGraphEdgeAttr(Ahat, plotStabSelec = FALSE, labels = labels,
       thres.point = 0.05,
       main=paste("POINT ESTIMATE FOR METHOD\n", toupper(method)))
    else
      plotGraphEdgeAttr(Ahat, plotStabSelec = TRUE, labels = labels,
       thres.point = 0, main = paste("STABILITY SELECTION
       ESTIMATE\n FOR METHOD", toupper(method)))
   }
}else{
    cat("\nThe packages 'backShift' and 'pcalg' are needed for the examples to
work. Please install them.")
}
 

 



