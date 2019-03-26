library(rODE)


### Name: step
### Title: step
### Aliases: step

### ** Examples

# +++++++++++++++++++++++++++++++++++++++++++++++++++ application: ReactionApp.R
# ReactionApp solves an autocatalytic oscillating chemical
# reaction (Brusselator model) using
# a fourth-order Runge-Kutta algorithm.

importFromExamples("Reaction.R")      # source the class

ReactionApp <- function(verbose = FALSE) {
    X <- 1; Y <- 5;
    dt <- 0.1

    reaction <- Reaction(c(X, Y, 0))
    solver <- RK4(reaction)
    rowvec <- vector("list")
    i <- 1
    while (getState(reaction)[3] < 100) {             # stop at t = 100
        rowvec[[i]] <- list(t = getState(reaction)[3],
                            X = getState(reaction)[1],
                            Y = getState(reaction)[2])
        solver   <- step(solver)
        reaction <- getODE(solver)
        i <-  i + 1
    }
    DT <- data.table::rbindlist(rowvec)
    return(DT)
}


solution <- ReactionApp()
plot(solution)





