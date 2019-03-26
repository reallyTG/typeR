library(MedOr)


### Name: conf.statement
### Title: Confidence Statement for Ordered Population Median
### Aliases: conf.statement print.conf.statement

### ** Examples

  set.seed(1234)
  # Statement: M1 < M2 < M3, where Mj is the population
  #   median of the group j.
  data <- NULL
  data$x1 <- rnorm(10,0,1)
  data$x2 <- rnorm(10,1,1)
  data$x3 <- rnorm(10,2,1)
  conf.statement(data)

  # Statement: M2 < M3 < M1, where Mj is the population
  #   median of the group j.
  data2 <- NULL
  data2$g1 <- data$x2
  data2$g2 <- data$x3
  data2$g3 <- data$x1
  conf.statement(data2)



