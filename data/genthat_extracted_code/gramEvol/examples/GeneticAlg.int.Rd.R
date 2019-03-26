library(gramEvol)


### Name: GeneticAlg.int
### Title: Genetic Algorithm with Integer Chromosomes
### Aliases: GeneticAlg.int print.GeneticAlg.int

### ** Examples


# define the evaluate function
evalfunc <- function(l) {
    # maximize the odd indices and minimize the even indices
    # no repeated values are allowed
    odd <- seq(1, 20, 2)
    even <- seq(2, 20, 2)
    err <- sum(l[even]) - sum(l[odd]);

    stopifnot(!any(duplicated(l))) # no duplication allowed

    return (err)
}

monitorFunc <- function(result) {
    cat("Best of gen: ", min(result$best$cost), "\n")
}

x <- GeneticAlg.int(genomeLen = 20, codonMin = 0, codonMax = 20,
                allowrepeat = FALSE, terminationCost = -110,
                monitorFunc = monitorFunc, evalFunc = evalfunc)

print(x)

best.result <- x$best$genome
print("Odds:")
print(sort(best.result[seq(1, 20, 2)]))
print("Evens:")
print(sort(best.result[seq(2, 20, 2)]))



