
if (Sys.getenv("Run_random_Tests")=="yes") {
    library(random)

    X <- randomNumbers()
    dim(X)                                  # cannot easily summary stats or content
    stopifnot(dim(X) == c(20L,5L))

    X <- randomSequence()                   # here we can test min and max as it is just a shuffle
    stopifnot(dim(X) == c(20L,1L))
    stopifnot(min(X) == 1L)
    stopfinot(max(x) == 20L)

    X <- randomStrings()
    stopifnot(dim(X) == c(10L,1L))
}
