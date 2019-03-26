## ----setup, echo=FALSE, results="hide"-----------------------------------
knitr::opts_chunk$set(comment = "#>", collapse = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  install.packages("LPWC")

## ---- eval = FALSE-------------------------------------------------------
#  devtools::install_github("gitter-lab/LPWC@vx.xx.x")
#  #OR
#  devtools::install_version("LPWC", version = "x.x.x", repos = "http://cran.us.r-project.org")

## ---- eval=FALSE---------------------------------------------------------
#  devtools::install_github("gitter-lab/LPWC")

## ----lib, results="asis", eval=TRUE--------------------------------------
library(LPWC)

## ----data, results='markup'----------------------------------------------
data(simdata)
simdata[1:5, ]
str(simdata)

## ----time----------------------------------------------------------------
timepoints <- c(0, 2, 4, 6, 8, 18, 24, 32, 48, 72)
timepoints

## ---- echo = FALSE, fig.height = 2, fig.width=4, warning = FALSE, fig.align='center'----
library(ggplot2)

set.seed(29876)


a <- rbind(c(rep(0, 5), 8, 0), c(rep(0, 4), 4.3, 0, 0)) + rnorm(2, 0, 0.5)

dat <- data.frame(intensity = as.vector(a), time = rep(c(0, 5, 15, 30, 45, 60, 75), each = 2), genes = factor(rep(c(1, 2), 7)))

a2 <- a
a2[1, ] <- c(a2[1, 2:7], NA)
dat2 <- data.frame(intensity = as.vector(a2), time = rep(c(0, 5, 15, 30, 45, 60, 75), each = 2), genes = factor(rep(c(1, 2), 7)))

a3 <- a
a3[2, ] <- c(NA, a3[2, 1:6])
a3[1, ] <- c(a3[1, 2:7], NA)
dat3 <- data.frame(intensity = as.vector(a3), time = rep(c(0, 5, 15, 30, 45, 60, 75), each = 2), genes = factor(rep(c(1, 2), 7)))


plot1 <- ggplot(dat, aes(x= time, y = intensity, group = genes)) + geom_line(aes(color = genes), size = 1.5) +  labs(x = "Time (min)") + labs(y = "Intensity") 
plot1

row1 <- c(0, 5, 15, 30, 45, 60, 75)
knitr::kable(t(data.frame(Original = row1, Gene1 = row1, Gene2 = row1)), align = 'c')





## ---- echo = FALSE, fig.height = 2, fig.width=4, warning = FALSE, fig.align='center'----

plot2 <- ggplot(dat2, aes(x= time, y = intensity, group = genes)) + geom_line(aes(color = genes), size = 1.5) + 
  labs(x = "Time (min)") + labs(y = "Intensity") 
plot2

row2 <- c(5, 15, 30, 45, 60, 75, "-")

knitr::kable(t(data.frame(Original = row1, Gene1 = row2, Gene2 = row1)), align = 'c')


## ---- echo = FALSE, fig.height = 2, fig.width=4, warning = FALSE, fig.align='center'----

plot3 <- ggplot(dat3, aes(x= time, y = intensity, group = genes)) + geom_line(aes(color = genes), size = 1.5) + 
  labs(x = "Time (min)") + labs(y = "Intensity") 
plot3

row3 <- c("-", 0, 5, 15, 30, 45, 60)

knitr::kable(t(data.frame(Original = row1, Gene1 = row2, Gene2 = row3)), align = 'c')


## ------------------------------------------------------------------------
LPWC::corr.bestlag(simdata[49:58, ], timepoints = timepoints, max.lag = 2, penalty = "high", iter = 10)

## ----clust1, fig.width=5-------------------------------------------------
dist <- 1 - LPWC::corr.bestlag(simdata[11:20, ], timepoints = timepoints, max.lag = 2, penalty = "low", iter = 10)$corr
plot(hclust(dist))

## ----clust 2-------------------------------------------------------------
dist <- 1 - LPWC::corr.bestlag(simdata[11:20, ], timepoints = timepoints, max.lag = 2, penalty = "low", iter = 10)$corr
cutree(hclust(dist), k = 3)

## ---- eval = FALSE-------------------------------------------------------
#  indexnon0 <- apply(data, 1, function(x){which(var(x) != 0)})
#  subset.data <- data[indexnon0, ]

## ----sessionInfo---------------------------------------------------------
sessionInfo()

## ---- eval = FALSE-------------------------------------------------------
#  
#  
#  # This function stores two different list separately
#  comb <- function(x, ...) {
#    lapply(seq_along(x),
#           function(i) c(x[[i]], lapply(list(...), function(y) y[[i]])))
#  }
#  
#  
#  # adding the data
#  data <- simdata[1:10, ]
#  # number of iterations
#  iter <- 10
#  # C values that are used in the algorithm
#  allC <- findC(timepoints = timepoints, iter = iter)
#  
#  # setting the clusters
#  core <- parallel::detectCores() - 1
#  cl <- parallel::makeCluster(core)
#  
#  # assigning the parallelization
#  doParallel::registerDoParallel(cl)
#  
#  
#  ## running the algorithm for different C
#  result <- foreach(i = 1:iter, .combine='comb', .multicombine=TRUE,
#                  .init=list(list(), list())) %dopar% {
#              lags <- best.lag(data, max.lag = 3, timepoints = timepoints, C = allC[i])
#              new.data <- prep.data(data = data, lags = lags, timepoints = timepoints)
#              corr <- comp.corr(new.data$data, new.data$time, C = allC[i])
#              return(list(corr, lags))
#                  }
#  
#  
#  # dividing the list into two different list: one for lags and one for all the correlations
#  allcorr <- result[[1]]
#  alllags <- result[[2]]
#  
#  # picking best C
#  val <- rep(NA, (length(iter) - 1))
#  for(i in 1:(iter - 1)){
#    val[i] <- sum((as.vector(allcorr[[i + 1]]) - as.vector(allcorr[[i]]))^2)
#  }
#  
#  # returning the results for the best C
#  result <- list(corr = allcorr[[which.min(val) + 1]], lags = alllags[[which.min(val) + 1]], C = values[which.min(val) + 1])
#  

