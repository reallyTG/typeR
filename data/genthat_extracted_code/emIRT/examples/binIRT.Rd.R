library(emIRT)


### Name: binIRT
### Title: Two-parameter Binary IRT estimation via EM
### Aliases: binIRT
### Keywords: multivariate

### ** Examples


## Data from 109th US Senate
data(s109)

## Convert data and make starts/priors for estimation
rc <- convertRC(s109)
p <- makePriors(rc$n, rc$m, 1)
s <- getStarts(rc$n, rc$m, 1)

## Conduct estimates
lout <- binIRT(.rc = rc,
                .starts = s,
                .priors = p,
                .control = {
                    list(threads = 1,
                         verbose = FALSE,
                         thresh = 1e-6
                         )
                }
                )

## Look at first 10 ideal point estimates
lout$means$x[1:10]


lout2 <- binIRT(.rc = rc,
                .starts = s,
                .priors = p,
                .control = {
                    list(threads = 1,
                         verbose = FALSE,
                         thresh = 1e-6
                         )
                },
                .anchor_subject = 2
                )
                                        # Rotates so that Sen. Sessions (R AL)
                                        # has more of the estimated trait

lout3 <- binIRT(.rc = rc,
                .starts = s,
                .priors = p,
                .control = {
                    list(threads = 1,
                         verbose = FALSE,
                         thresh = 1e-6
                         )
                },
                .anchor_subject = 10
                )
                                        # Rotates so that Sen. Boxer (D CA)
                                        # has more of the estimated trait

cor(lout2$means$x[, 1],
    lout3$means$x[, 1]
    )
                                        # = -1 --> same numbers, flipped
                                        # orientation




