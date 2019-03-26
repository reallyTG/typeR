## ---- eval = FALSE-------------------------------------------------------
#  
#  library(ecolottery)
#  
#  require(vegan)
#  data(BCI)
#  # Size (= number of individual trees) of subplots
#  comm.size <- rowSums(BCI)
#  # Minimum subplot size
#  comm.size.min <- min(comm.size)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  # Rarefy to minimum sample size
#  bci.res <- rrarefy(BCI, sample = comm.size.min)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  library(betapart)
#  # Compute diversity indices
#  rich.obs <- apply(bci.res, 1, function(x) sum(x!=0))
#  shan.obs <- apply(bci.res, 1, function(x) diversity(x, index = "shannon"))
#  beta.obs <- lapply(beta.pair.abund(bci.res), function(x) {
#    X = rowMeans(as.matrix(x), na.rm=T)
#  })$beta.bray
#  stats.obs <- c(rich.obs, shan.obs, beta.obs)
#  names(stats.obs) <- paste0(rep(c("rich", "shan", "beta"), each = 50), 1:50)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  m.samp <- runif(2*10^5, min = 0, max = 1)
#  theta.samp <- runif(2*10^5, min = 0, max = 100)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  library(parallel)
#  # Start up a parallel cluster
#  parallelCluster <- makeCluster(parallel::detectCores())
#  print(parallelCluster)
#  # Function to perform simulations
#  mkWorker <- function(m.samp, theta.samp, J)
#  {
#    require(ecolottery)
#    require(untb)
#    force(J)
#    force(m.samp)
#    force(theta.samp)
#    summCalc <- function(j, m.samp, theta.samp, J)
#    {
#      pool.samp <- ecolottery::coalesc(100*J, theta = theta.samp[j])$pool
#      meta.samp <- array(0, c(50,length(unique(pool.samp$sp))))
#      colnames(meta.samp) <- unique(pool.samp$sp)
#      for(i in 1:50)
#      {
#        comm.samp <- ecolottery::coalesc(J, m.samp[j], pool = pool.samp);
#        tab <- table(comm.samp$com[,2])
#        meta.samp[i, names(tab)] <- tab
#      }
#      rich.samp <- apply(meta.samp, 1, function(x) sum(x != 0))
#      shan.samp <- apply(meta.samp, 1, function(x) vegan::diversity(x, index = "shannon"))
#      beta.samp <- lapply(betapart::beta.pair.abund(meta.samp),
#                          function(x) rowMeans(as.matrix(x), na.rm=T)
#      )$beta.bray
#      return(list(sum.stats = c(rich.samp, shan.samp, beta.samp),
#                  param = c(m.samp[j], theta.samp[j])))
#    }
#    worker <- function(j) {
#      summCalc(j, m.samp, theta.samp, J)
#    }
#    return(worker)
#  }
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  modelbci <- parLapply(parallelCluster, 2:10^5, mkWorker(m.samp, theta.samp, comm.size.min))
#  # IMPORTANT
#  # Shutdown cluster after calculation
#  if(!is.null(parallelCluster)) {
#    stopCluster(parallelCluster)
#    parallelCluster <- c()
#  }
#  # Summary statistics and parameter values are extracted
#  # and stored in matrices
#  stats <- t(sapply(modelbci, function(x) x$sum.stats))
#  stats.sd <- apply(stats, 2, sd)
#  stats.mean <- apply(stats, 2, mean)
#  stats <- t(apply(stats, 1, function(x) (x - stats.mean)/stats.sd))
#  colnames(stats) <- paste0(rep(c("rich", "shan", "beta"), each = 50), 1:50)
#  
#  stats.obs <- (stats.obs-stats.mean)/stats.sd
#  param <- t(sapply(modelbci, function(x) x$param))
#  colnames(param) <- c("m", "theta")
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  require(abc)
#  bci.abc <- abc(target = stats.obs, param = param, sumstat = stats, tol = 0.01, method = "neuralnet")
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  # Define the function providing the summary statistics
#  f.sumstats <- function(tab)
#  {
#    rich <- apply(tab, 1, function(x) sum(x!=0))
#    shan <- apply(tab, 1, function(x) vegan::diversity(x, index="shannon"))
#    beta <- lapply(betapart::beta.pair.abund(tab),
#                   function(x) rowMeans(as.matrix(x), na.rm=T))$beta.bray
#    stats <- c(rich, shan, beta)
#    names(stats) <- paste0(rep(c("rich", "shan", "beta"), each = 50), 1:50)
#    return(stats)
#  }
#  
#  # Perform the simulations and the ABC analysis
#  bci.abc <- coalesc_abc(bci.res, multi = "tab", traits = NULL,
#                         f.sumstats = f.sumstats, params = NULL,
#                         theta.max = 100, nb.samp = 100, tol = 0.01,
#                         pkg = c("vegan","betapart"), parallel = T)
#  

## ---- eval=F-------------------------------------------------------------
#  
#  cv <- cv4abc(param = bci.abc$par, sumstat = bci.abc$ss,
#               nval = 500, tols = c(10^-2, 10^-1, 1), method="neuralnet")
#  plot(cv)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  plot(bci.abc$abc, param=bci.abc$par)
#  

## ---- eval = FALSE-------------------------------------------------------
#  
#  summary(bci.abc$abc)
#  

