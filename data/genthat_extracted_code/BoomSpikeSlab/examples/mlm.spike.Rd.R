library(BoomSpikeSlab)


### Name: mlm.spike
### Title: Spike and slab multinomial logistic regression
### Aliases: mlm.spike
### Keywords: models regression

### ** Examples


rmulti <- function (prob) {
  ## Sample from heterogeneous multinomial distributions.
    if (is.vector(prob)) {
        S <- length(prob)
        return(sample(1:S, size = 1, prob = prob))
    }
    nc <- apply(prob, 1, sum)
    n <- nrow(prob)
    S <- ncol(prob)
    u <- runif(n, 0, nc)
    alive <- rep(TRUE, n)
    z <- numeric(n)
    p <- rep(0, n)
    for (s in 1:S) {
        p <- p + prob[, s]
        indx <- alive & (u < p)
        alive[indx] <- FALSE
        z[indx] <- s
        if (!any(alive))
            break
    }
    return(z)
}

## Define sizes for the problem
subject.predictor.dimension <- 3
choice.predictor.dimension <- 4
nchoices <- 5
nobs <- 1000

## The response can be "a", "b", "c", ...
choice.levels <- letters[1:nchoices]

## Create "subject level characteristics".
subject.x <- matrix(rnorm(nobs * (subject.predictor.dimension - 1)),
                    nrow = nobs)
subject.beta <- cbind(
    0, matrix(rnorm(subject.predictor.dimension * (nchoices - 1)),
              ncol = nchoices - 1))
colnames(subject.x) <- state.name[1:ncol(subject.x)]

## Create "choice level characteristics".
choice.x <- matrix(rnorm(nchoices * choice.predictor.dimension * nobs),
                   nrow = nobs)
choice.characteristics <- c("foo", "bar", "baz", "qux")
choice.names <- as.character(outer(choice.characteristics, choice.levels, FUN = paste, sep = ":"))
colnames(choice.x) <- choice.names
choice.beta <- rnorm(choice.predictor.dimension)

## Combine an intercept term, subject data, and choice data.
X <- cbind(1, subject.x, choice.x)
p <- ncol(X)
true.beta <- c(subject.beta[, -1], choice.beta)
Beta <- matrix(nrow = nchoices, ncol = p)
for (m in 1:nchoices) {
  Beta[m, ] <- rep(0, p)
  Beta[m, 1:subject.predictor.dimension] <- subject.beta[, m]
  begin <- subject.predictor.dimension + 1 + (m-1) * choice.predictor.dimension
  end <- begin + choice.predictor.dimension - 1
  Beta[m, begin:end] <- choice.beta
}

eta <- X %*% t(Beta)
prob <- exp(eta)
prob <- prob / rowSums(prob)
response <- as.factor(choice.levels[rmulti(prob)])
simulated.data <- as.data.frame(X[, -1])
simulated.data$response <- response

model <- mlm.spike(response ~ Alabama + Alaska,
                   response ~ foo + bar + baz + qux,
                   niter = 500,
                   choice.name.separator = ":",
                   expected.subject.model.size = -1,
                   expected.choice.model.size = -1,
                   data = simulated.data,
                   proposal.weights = c("DA" = .8, "RWM" = .1, "TIM" = .1))




