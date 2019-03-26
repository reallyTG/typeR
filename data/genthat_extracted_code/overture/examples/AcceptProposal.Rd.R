library(overture)


### Name: AcceptProposal
### Title: Determine if a Metropolis–Hastings step should be accepted
### Aliases: AcceptProposal

### ** Examples

# Sample from triangular distribution P(x) = -2x + 2 ----------------------
# Target distribution
LogP <- function(x) {
    log(-2*x + 2)
}

# Generate proposals using Beta(1/2, 1/2)
shape1 <- 1/2
shape2 <- 1/2

RProp <- function() { # Draw proposal
    rbeta(1, shape1, shape2)
}

DLogProp <- function(x) { # Log density of proposal distribution
    dbeta(x, shape1, shape2, log=TRUE)
}

SampleX <- function(x) { # Draw once from the target distribution
    x.prop <- RProp()
    if(AcceptProposal(LogP(x), LogP(x.prop), DLogProp(x.prop), DLogProp(x))) {
        x <- x.prop
    }

    return(x)
}

# Draw from the target distribution
n.samples <- 10000
samples <- vector(length=n.samples)
x <- 0.5
Mcmc <- InitMcmc(n.samples)
samples <- Mcmc({
    x <- SampleX(x)
})

# Plot the results
hist(samples$x, freq=FALSE, ylim=c(0, 2.5), xlim=c(0, 1), xlab="x")
grid <- seq(0, 1, length.out=500)
lines(grid, exp(LogP(grid)), col="blue")
legend("topright", legend="True density", lty=1, col="blue", cex=0.75)



