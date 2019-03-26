library(datadr)


### Name: mrExec
### Title: Execute a MapReduce Job
### Aliases: mrExec

### ** Examples

# compute min and max Sepal Length by species for iris data
# using a random partitioning of it as input
d <- divide(iris, by = rrDiv(20))

mapExp <- expression({
  lapply(map.values, function(r) {
    by(r, r$Species, function(x) {
      collect(
        as.character(x$Species[1]),
        range(x$Sepal.Length, na.rm = TRUE)
      )
    })
  })
})

reduceExp <- expression(
  pre = {
    rng <- c(Inf, -Inf)
  }, reduce = {
    rx <- unlist(reduce.values)
    rng <- c(min(rng[1], rx, na.rm = TRUE), max(rng[2], rx, na.rm = TRUE))
  }, post = {
    collect(reduce.key, rng)
})

res <- mrExec(d, map = mapExp, reduce = reduceExp)
as.list(res)




