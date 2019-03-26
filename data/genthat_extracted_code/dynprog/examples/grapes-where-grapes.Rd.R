library(dynprog)


### Name: %where%
### Title: Connects a recursion with sequences it should recurse over.
### Aliases: %where%

### ** Examples


# Fibonnaci numbers
fib <- {
  F[n] <- 1 ? n <= 2
  F[n] <- F[n-1] + F[n-2]
} %where% {
  n <- 1:10
}
fib

# Edit distance
x <- c("a", "b", "c")
y <- c("a", "b", "b", "c")
edit <- {
    E[1,j] <- j - 1
    E[i,1] <- i - 1
    E[i,j] <- min(
        E[i - 1,j] + 1,
        E[i,j - 1] + 1,
        E[i - 1,j - 1] + (x[i - 1] != y[j - 1])
    )
} %where% {
    i <- 1:(length(x) + 1)
    j <- 1:(length(y) + 1)
}
edit




