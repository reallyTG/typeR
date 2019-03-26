library(wrapr)


### Name: execute_parallel
### Title: Execute f in parallel partitioned by partition_column.
### Aliases: execute_parallel

### ** Examples


if(requireNamespace("parallel", quietly = TRUE)) {
  cl <- parallel::makeCluster(2)

  d <- data.frame(x = 1:5, g = c(1, 1, 2, 2 ,2))
  f <- function(dl) {
    d <- dl$d
    d$s <- sqrt(d$x)
    d
  }
  r <- execute_parallel(list(d = d), f,
                        partition_column = "g",
                        cl = cl) %.>%
    do.call(rbind, .) %.>%
    print(.)

  parallel::stopCluster(cl)
}




