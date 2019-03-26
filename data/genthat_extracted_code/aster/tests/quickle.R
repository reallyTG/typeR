
library(aster)

data(radish)

pred <- c(0,1,2)
fam <- c(1,3,2)

### try reaster

rout <- reaster(resp ~ varb + fit : (Site * Region),
    list(block = ~ 0 + fit : Block, pop = ~ 0 + fit : Pop),
    pred, fam, varb, id, root, data = radish)
srout <- summary(rout)
names(rout)

foo <- new.env(parent = emptyenv())
bar <- suppressWarnings(try(load("quickle.rda", foo), silent = TRUE))
if (inherits(bar, "try-error")) {
    save(srout, file = "quickle.rda")
} else {
    srout$object$iterations <- NULL
    foo$srout$object$iterations <- NULL
    print(all.equal(srout, foo$srout, tol = 1e-4))
}

alpha.mle <- rout$alpha
bee.mle <- rout$b
nu.mle <- rout$sigma^2
zwz.mle <- rout$zwz
obj <- rout$obj
fixed <- rout$fixed
random <- rout$random
alphanu.mle <- c(alpha.mle, nu.mle)

qout <- quickle(alphanu.mle, bee.mle, fixed, random, obj,
    zwz = zwz.mle, deriv = 2)

objfun <- function(alphanu) quickle(alphanu, bee.mle, fixed, random,
    obj, zwz = zwz.mle)$value
gradfun <- function(alphanu) quickle(alphanu, bee.mle, fixed, random,
    obj, zwz = zwz.mle, deriv = 1)$gradient
oout <- optim(alphanu.mle, objfun, gradfun, method = "BFGS", hessian = TRUE)
all.equal(qout$hessian, oout$hessian, check.attributes = FALSE,
    tolerance = 0.002)

