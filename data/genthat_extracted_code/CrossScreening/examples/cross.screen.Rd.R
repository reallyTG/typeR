library(CrossScreening)


### Name: cross.screen
### Title: Cross-screening
### Aliases: cross.screen cross.screen.fg

### ** Examples


n <- 100
p <- 20
d <- matrix(rnorm(n * p), n, p)
d[, 1] <- d[, 1] + 2
d1 <- d[1:(n/2), ]
d2 <- d[(n/2+1):n, ]
cross.screen(d1, d2,
             gamma = 9,
             gamma.screen = 1.25)$p

## One can run the hidden function CrossScreening:::table5(no.sims = 1)
## to generate Table 5 in the paper.


## The following code generates Table 1 in the paper.

require(CrossScreening)
data(nhanes.fish)
data(nhanes.fish.match)

data <- nhanes.fish
match <- nhanes.fish.match

outcomes <- grep("^o\\.", names(data))
log2diff <- function(y1, y2) {
    if (min(c(y1, y2)) == 0) {
        y1 <- y1 + 1
        y2 <- y2 + 1
    }
    log2(y1) - log2(y2)
}
d <- sapply(outcomes, function(j) log2diff(data[match$treated, j], data[match$control, j]))
set.seed(11)
split <- sample(1:nrow(d), nrow(d) / 2, replace = FALSE)
d1 <- d[split, ]
d2 <- d[-split, ]

mm <- matrix(c(2, 2, 2, 8, 5, 8), ncol = 2)
data.frame(outcome = names(data)[outcomes],
           p.value =
               cross.screen(d1, d2,
                            gamma = 9,
                            screen.value = "p",
                            screen.method = "least.sensitive",
                            mm = mm)$p)





