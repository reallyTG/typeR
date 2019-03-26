library(SOUP)


### Name: SOUP
### Title: SOUP Main Function
### Aliases: SOUP

### ** Examples

###
### testing SOUP
###
rm(list = ls()); gc(reset = TRUE)

require(SOUP)
n <- 5L         # replication of the experiment
G <- 4L         # number of groups
nVar <- 10L     # number of variables
shift <- 1.5    # shift to be added to group 3
alpha <- c(0.01, 0.05, 0.1)        # significance levels

## groups factor
groups <- gl(G, n, labels = paste("gr", seq_len(n), sep = "_"))

set.seed(12345)
Y <- matrix(rnorm(n * G * nVar), nrow = n * G, ncol = nVar)
colnames(Y) <- paste("var", seq_len(nVar), sep = "_")
ind1 <- groups == unique(groups)[3L]
Y[ind1, ] <- Y[ind1, ] + shift

res <- SOUP(Y = Y, covars = as.matrix(groups), analysisType = "simple",
        testStatistic = "meanDiff", combFunct = "Fisher",
        alpha = alpha,
        subsets = list("first" = 1:5, "second" = 6:10),
        weights = list(
                "firstW" = c(.1, .2, .1, .5, .1),
                "secondW" = rep.int(1, 5)),
        p.valuesType = "permutation", p.adj.method = "FWEminP")
res



