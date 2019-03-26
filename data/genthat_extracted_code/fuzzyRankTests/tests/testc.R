
  library(fuzzyRankTests)

  options(digits=5) # avoid rounding differences

  x <- c(1, 2, 3, 4, 4, 4, 5, 6, 7)
  y <- c(4, 5, 7, 7, 8, 9, 10, 11)
  mu <- 0
  tol <- sqrt(.Machine$double.eps)

 .Call(fuzzyRankTests:::C_fpvranksum, x, y, mu, "less", tol)

 .Call(fuzzyRankTests:::C_fpvranksum, x, y, mu, "two.sided", tol)

 .Call(fuzzyRankTests:::C_fpvranksum, x, y, mu = -3, "two.sided", tol)

 .Call(fuzzyRankTests:::C_fpvranksum, x, y, mu = -4, "two.sided", tol)

 y <- c(-1, y)

 .Call(fuzzyRankTests:::C_fpvranksum, x, y, mu = -3, "two.sided", tol)

 .Call(fuzzyRankTests:::C_fpvranksum, x, y, mu, "less", tol)

 .Call(fuzzyRankTests:::C_fpvranksum, y, x, mu, "greater", tol)

 set.seed(42)
 x <- rnorm(10)
 y <- rnorm(10) + 1.5
 .Call(fuzzyRankTests:::C_fpvranksum, sort(x), sort(y), mu, "two.sided", tol)

 ##### Check that init.c actually protects against the segfault we got
 ##### during development.
 ##### It does once we got the name "R_init_fuzzyRankTests" right!

 try(.Call(fuzzyRankTests:::C_fpvranksum, y, x, mu, "great"))

