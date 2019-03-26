## ---- comment = ""-------------------------------------------------------
suppressPackageStartupMessages(library(dplyr))
library(JacobiEigen)
library(stats)

imod <- aov(cbind(Sepal.Length, Sepal.Width, Petal.Length, Petal.Width) ~ Species, iris)
(R <- cor(resid(imod)))

rEig <- JacobiR(R) 
cEig <- Jacobi(R)
identical(rEig, cEig)  ## the R and Rcpp implementations are identical
cEig
(eEig <- eigen(R)) ## eigenvectors differ in signs
all.equal(eEig$values, cEig$values)  ## eigenvalues are (practically) identical

## ---- comment = ""-------------------------------------------------------
library(rbenchmark)
benchmark(JacobiR(R), Jacobi(R), JacobiS(R), eigen(R), columns = c("test", "elapsed")) %>% 
  arrange(elapsed)

## ---- comment = "", eval = FALSE-----------------------------------------
#  set.seed(12345)
#  N <- 100
#  iseq <- seq(10, 100, by = 10)
#  res <- lapply(iseq,  function(n) {
#    S <- crossprod(matrix(rnorm(N*n), N, n))/N
#    runTime <- benchmark(JacobiR(S), Jacobi(S), JacobiS(S), eigen(S),
#                         replications = N,
#                         columns = c("test", "elapsed"))
#    cbind(n = n, runTime)
#  }) %>%
#    do.call(rbind, .) %>%
#    within({
#      elapsed <- log10(1000*elapsed/N)
#    })
#  
#  suppressPackageStartupMessages(library(ggplot2))
#  ggplot(res) + aes(x = n, y = elapsed, colour = test) + geom_line() + geom_point() +
#    scale_colour_manual(values = c("eigen(S)" = "pale violet red", "Jacobi(S)" = "steel blue",
#                                  "JacobiS(S)" = "sky blue", "JacobiR(S)" = "tan")) +
#    xlab("matrix size") +
#    ylab(expression(log[10](italic("mean run time [ms]")))) + theme_minimal() +
#    theme(legend.position = "bottom", legend.title = element_blank())

## ---- echo = FALSE-------------------------------------------------------
knitr::include_graphics(file.path(getwd(), "benchmarks.pdf"))

