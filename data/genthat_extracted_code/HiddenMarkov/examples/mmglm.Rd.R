library(HiddenMarkov)


### Name: mmglm
### Title: Markov Modulated GLM Object
### Aliases: mmglm0 mmglm1 mmglmlong1
### Keywords: classes

### ** Examples

#--------------------------------------------------------
#     Gaussian with identity link function
#         using mmglm0

delta <- c(0,1)

Pi <- matrix(c(0.8, 0.2,
               0.3, 0.7),
             byrow=TRUE, nrow=2)

beta <- matrix(c(0.1, -0.1,
                 1.0,  5.0),
               byrow=TRUE, nrow=2)

x <- mmglm0(NULL, Pi, delta, family="gaussian", link="identity",
            beta=beta, sigma=c(1, 2))

n <- 1000
x <- simulate(x, nsim=n, seed=10)

#   Increase maxiter below to achieve convergence
#   Has been restricted to minimise time of package checks
y <- BaumWelch(x, bwcontrol(maxiter=2))

w <- hist(residuals(y))
z <- seq(-3, 3, 0.01)
points(z, dnorm(z)*n*(w$breaks[2]-w$breaks[1]), col="red", type="l")
box()

print(summary(y))
print(logLik(y))


#--------------------------------------------------------
#    Gaussian with log link function
#         using mmglm1

n <- 1000

#   the range of x needs changing according to the glmfamily
x <- seq(-0.9, 1.5, length.out=n)

colour <- c("blue", "green", "red")
colnum <- rep(1:3, n/3+1)[1:n] - 1

data <- data.frame(x=x, colour=colour[colnum+1])

#   will simulate response variable, not required in formula
#   design matrix only depends on RHS of formula
glmformula <- formula( ~ x + I(x^2) + colour)
glmfamily <- gaussian(link="log")
Xdesign <- model.matrix(glmformula, data=data)

# --- Parameter Values and Simulation ---

Pi <- matrix(c(0.8, 0.2,
               0.3, 0.7),
             byrow=TRUE, nrow=2)

delta <- c(1, 0)

sd <- c(1.2, 1)

beta <- matrix(c(-1, -1.2,
                 -2, -1.8,
                  3,  2.8,
                  1,  0.8, 
                  2,  2.2), 
               ncol=ncol(Pi), nrow=ncol(Xdesign), byrow=TRUE)

y <- mmglm1(NULL, Pi, delta, glmfamily, beta, Xdesign, sigma=sd)

y <- simulate(y, seed=5)

# --- Estimation ---

#   Increase maxiter below to achieve convergence
#   Has been restricted to minimise time of package checks
tmp <- BaumWelch(y, bwcontrol(posdiff=FALSE, maxiter=2))
print(summary(tmp))


#-------------------------------------------------
#    Binomial with logit link function
#         using mmglm1

#   n = series length
n <- 1000

#   the range of x need changing according to the glmfamily
x <- seq(-1, 1.5, length.out=n)

colour <- c("blue", "green", "red")
colnum <- rep(1:3, n/3+1)[1:n] - 1

data <- data.frame(x=x, colour=colour[colnum+1])

glmformula <- formula( ~ x + I(x^2) + colour)
glmfamily <- binomial(link="logit")
Xdesign <- model.matrix(glmformula, data=data)

# --- Parameter Values and Simulation ---

Pi <- matrix(c(0.8, 0.2,
               0.3, 0.7),
             byrow=TRUE, nrow=2)

delta <- c(1, 0)

beta <- matrix(c(-1, -1.2,
                 -2, -1.8,
                  3,  2.8,
                  1,  0.8, 
                  2,  2.2), 
               ncol=ncol(Pi), nrow=ncol(Xdesign), byrow=TRUE)

y <- mmglm1(NULL, Pi, delta, glmfamily, beta, Xdesign, sigma=sd,
            size=rep(100, n))

#   each element of y$y is the number of successes in 100 Bernoulli trials
y <- simulate(y, seed=5)


# --- Estimation ---

#   Increase maxiter below to achieve convergence
#   Has been restricted to minimise time of package checks
tmp <- BaumWelch(y, bwcontrol(posdiff=FALSE, maxiter=2))
print(summary(tmp))


#-------------------------------------------------
#    Gaussian with log link function, longitudinal data
#         using mmglmlong1

#   n = series length for each subject
#   N = number of subjects
n <- 5
N <- 1000

#   the range of x need changing according to the glmfamily
x <- seq(-0.9, 1.5, length.out=n)

colour <- c("blue", "green", "red")
colnum <- rep(1:3, n/3+1)[1:n] - 1

data <- data.frame(x=x, colour=colour[colnum+1])

#   will simulate response variable, not required in formula
#   design matrix only depends on RHS of formula
glmformula <- formula( ~ x + I(x^2) + colour)
glmfamily <- gaussian(link="log")
Xdesign0 <- model.matrix(glmformula, data=data)

#    multiple subjects
Xdesign <- NULL
for (i in 1:N) Xdesign <- rbind(Xdesign, Xdesign0)

# --- Parameter Values and Simulation ---

Pi <- matrix(c(0.8, 0.2,
               0.3, 0.7),
             byrow=TRUE, nrow=2)

delta <- c(0.5, 0.5)

sd <- c(1.2, 1)

beta <- matrix(c(-1, -1.2,
                 -2, -1.8,
                  3,  2.8,
                  1,  0.8, 
                  2,  2.2), 
               ncol=ncol(Pi), nrow=ncol(Xdesign), byrow=TRUE)

y <- mmglmlong1(NULL, Pi, delta, glmfamily, beta, Xdesign, sigma=sd,
                longitude=rep(1:N, each=n))

y <- simulate(y, seed=5)

# --- Estimation ---

#    Note: the "Not run" blocks below are not run during package checks
#    as the makePSOCKcluster definition is specific to my network,
#    modify accordingly if you want parallel processing.

cl <- NULL
## Not run: 
##D if (require(parallel)){
##D     cl <- makePSOCKcluster(c("localhost", "horoeka.localdomain", 
##D                              "horoeka.localdomain", "localhost"))
##D }
## End(Not run)

#   Increase maxiter below to achieve convergence
#   Has been restricted to minimise time of package checks
tmp <- BaumWelch(y, bwcontrol(posdiff=FALSE, maxiter=2),
                 PSOCKcluster=cl)

## Not run: 
##D if (!is.null(cl)){
##D     stopCluster(cl)
##D     rm(cl)
##D }
## End(Not run)

print(summary(tmp))


#-------------------------------------------------
#    Binomial with logit link function, longitudinal data
#         using mmglmlong1

#   n = series length for each subject
#   N = number of subjects
n <- 10
N <- 100

#   the range of x need changing according to the glmfamily
x <- seq(-1, 1.5, length.out=n)

colour <- c("blue", "green", "red")
colnum <- rep(1:3, n/3+1)[1:n] - 1

data <- data.frame(x=x, colour=colour[colnum+1])

glmformula <- formula( ~ x + I(x^2) + colour)
glmfamily <- binomial(link="logit")
Xdesign0 <- model.matrix(glmformula, data=data)

#    multiple subjects
Xdesign <- NULL
for (i in 1:N) Xdesign <- rbind(Xdesign, Xdesign0)

# --- Parameter Values and Simulation ---

Pi <- matrix(c(0.8, 0.2,
               0.3, 0.7),
             byrow=TRUE, nrow=2)

delta <- c(0.5, 0.5)

beta <- matrix(c(-1, -1.2,
                 -2, -1.8,
                  3,  2.8,
                  1,  0.8, 
                  2,  2.2), 
               ncol=ncol(Pi), nrow=ncol(Xdesign), byrow=TRUE)

y <- mmglmlong1(NULL, Pi, delta, glmfamily, beta, Xdesign, sigma=sd,
                longitude=rep(1:N, each=n), size=rep(200, N*n))

y <- simulate(y, seed=5)

# --- Estimation ---

#   Increase maxiter below to achieve convergence
#   Has been restricted to minimise time of package checks
tmp <- BaumWelch(y, bwcontrol(posdiff=FALSE, maxiter=1))
print(summary(tmp))



