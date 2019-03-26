## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  # fig.path = "man/figures/README-",
  out.width = "100%"
)

## ---- eval = FALSE-------------------------------------------------------
#  devtools::install_github("martakarass/runstats")

## ---- eval = FALSE-------------------------------------------------------
#  library(runstats)
#  
#  ## Example: running correlation
#  x0 <- sin(seq(0, 2 * pi * 5, length.out = 1000))
#  x  <- x0 + rnorm(1000, sd = 0.1)
#  pattern <- x0[1:100]
#  out1 <- RunningCor(x, pattern)
#  out2 <- RunningCor(x, pattern, circular = TRUE)
#  
#  ## Example: running mean
#  x <- cumsum(rnorm(1000))
#  out1 <- RunningMean(x, W = 100)
#  out2 <- RunningMean(x, W = 100, circular = TRUE)

## ---- eval = FALSE-------------------------------------------------------
#  ## Example: demo for running correlation method
#  runstats.demo("RunningCor")

## ---- eval = FALSE-------------------------------------------------------
#  ## Example: demo for running mean method
#  runstats.demo("RunningMean")

## ---- echo=FALSE, include=FALSE------------------------------------------
library(rbenchmark)
library(ggplot2)

## ---- eval = FALSE-------------------------------------------------------
#  library(rbenchmark)
#  
#  set.seed (20181010)
#  x.N.seq <- 10^(3:7)
#  x.list  <- lapply(x.N.seq, function(N) runif(N))
#  y <- runif(100)
#  
#  ## Benchmark execution time of RunningCov
#  out.df <- data.frame()
#  for (x.tmp in x.list){
#    out.df.tmp <- benchmark("runstats" = runstats::RunningCov(x.tmp, y),
#                            replications = 10,
#                            columns = c("test", "replications", "elapsed",
#                                        "relative", "user.self", "sys.self"))
#    out.df.tmp$x_length <- length(x.tmp)
#    out.df.tmp$pattern_length <- length(y)
#    out.df <- rbind(out.df, out.df.tmp)
#  }
#  

## ---- echo = FALSE, eval = FALSE-----------------------------------------
#  
#  out.df.path <- "../inst/benchmark_results/2018-12-17-performance_rbenchmark_suite1.csv"
#  write.csv(out.df, out.df.path, row.names = FALSE, quote = FALSE)

## ---- echo = FALSE, eval = TRUE------------------------------------------
out.df.path <- "../inst/benchmark_results/2018-12-17-performance_rbenchmark_suite1.csv"
out.df <- read.csv(out.df.path)
options("scipen" = 10, "digits" = 4)

## ------------------------------------------------------------------------
knitr::kable(out.df)

## ---- eval = FALSE-------------------------------------------------------
#  ## Conventional approach
#  RunningCov.sapply <- function(x, y){
#    l_x <- length(x)
#    l_y <- length(y)
#    sapply(1:(l_x - l_y + 1), function(i){
#      cov(x[i:(i+l_y-1)], y)
#    })
#  }
#  
#  set.seed (20181010)
#  
#  out.df2 <- data.frame()
#  for (x.tmp in x.list[c(1,2,3,4)]){
#    out.df.tmp <- benchmark("conventional" = RunningCov.sapply(x.tmp, y),
#                            "runstats" = runstats::RunningCov(x.tmp, y),
#                            replications = 10,
#                            columns = c("test", "replications", "elapsed",
#                                        "relative", "user.self", "sys.self"))
#    out.df.tmp$x_length <- length(x.tmp)
#    out.df2 <- rbind(out.df2, out.df.tmp)
#  }
#  

## ---- echo = FALSE, eval = FALSE-----------------------------------------
#  out.df.path <-"../inst/benchmark_results/2018-12-17-performance_rbenchmark_suite2.csv"
#  write.csv(out.df2, out.df.path, row.names = FALSE, quote = FALSE)

## ---- echo = FALSE, eval = TRUE------------------------------------------
out.df.path <- "../inst/benchmark_results/2018-12-17-performance_rbenchmark_suite2.csv"
out.df2 <- read.csv(out.df.path)

## ---- fig.width=10, fig.height=5-----------------------------------------
library(ggplot2)

plt1 <- 
  ggplot(out.df2, aes(x = x_length, y = elapsed, color = test)) + 
  geom_line() + geom_point(size = 3) + scale_x_log10() + 
  theme_minimal(base_size = 14) + 
  labs(x = "Vector length of x",
       y = "Elapsed [s]", color = "Method", 
       title = "Running covariance rbenchmark") + 
  theme(legend.position = "bottom")
plt2 <- 
  plt1 + 
  scale_y_log10() + 
  labs(y = "Log of elapsed [s]")

cowplot::plot_grid(plt1, plt2, nrow = 1, labels = c('A', 'B'))

## ------------------------------------------------------------------------
sessioninfo::platform_info()

