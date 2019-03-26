library(finiteruinprob)


### Name: rriskproc
### Title: Simulation of a risk process that is perturbed by a Wiener
###   process
### Aliases: rriskproc
### Keywords: ts datagen distribution models

### ** Examples

    require(sdprisk)

    rriskproc(m        = 1001,
              window   = c(0, 5),
              num      = 1,
              sigma    = sqrt(0.4),
              freq     = 1,
              drift    = 2,
              jumpdist = rhypoexp,
              rate     = c(1, 10))

    # The same can be achieved using
    #   jumpdist = function(n) rexp(n, 1) + rexp(n, 10)

    rriskproc(window = c(0, 10),
              jumpdist = function(n) {
                  rexp(n, 1) + rexp(n, 10)
              })




