## ------------------------------------------------------------------------
table_2_2 <- data.frame(Z = c(1, 0, 0, 0, 0, 0, 1),
                        Y = c(15, 15, 20, 20, 10, 15, 30))

## ------------------------------------------------------------------------
library(ri2)

# Declare randomization procedure
declaration <- declare_ra(N = 7, m = 2)

# Conduct Randomization Inference
ri2_out <- conduct_ri(
  formula = Y ~ Z,
  declaration = declaration,
  sharp_hypothesis = 0,
  data = table_2_2
)

summary(ri2_out)
plot(ri2_out)

## ------------------------------------------------------------------------
dat <- data.frame(
  Y = c(8, 6, 2, 0, 3, 1, 1, 1, 2, 2, 0, 1, 0, 2, 2, 4, 1, 1),
  Z = c(1, 1, 0, 0, 1, 1, 0, 0, 1, 1, 1, 1, 0, 0, 1, 1, 0, 0),
  cluster = c(1, 1, 2, 2, 3, 3, 4, 4, 5, 5, 6, 6, 7, 7, 8, 8, 9, 9),
  block = c(rep(1, 4), rep(2, 6), rep(3, 8))
)

# clusters in blocks 1 and 3 have a 1/2 probability of treatment
# but clusters in block 2 have a 2/3 probability of treatment
with(dat, table(block, Z))

block_m <- with(dat, tapply(Z, block, sum) / 2)

declaration <- 
  with(dat,{
    declare_ra(
      blocks = block,
      clusters = cluster,
      block_m = block_m)
  })

declaration

ri2_out <- conduct_ri(
  Y ~ Z,
  sharp_hypothesis = 0,
  declaration = declaration,
  data = dat
)
summary(ri2_out)
plot(ri2_out)

## ------------------------------------------------------------------------
N <- 100
# three-arm trial, treat 33, 33, 34 or 33, 34, 33, or 34, 33, 33
declaration <- declare_ra(N = N, num_arms = 3)

Z <- conduct_ra(declaration)
Y <- .9 * .2 * (Z == "T2") + -.1 * (Z == "T3") + rnorm(N)
dat <- data.frame(Y, Z)

ri2_out <-
  conduct_ri(
    model_1 = Y ~ 1, # restricted model
    model_2 = Y ~ Z, # unrestricted model
    declaration = declaration,
    sharp_hypothesis = 0,
    data = dat
  )

plot(ri2_out)
summary(ri2_out)

# for comparison
anova(lm(Y ~ 1, data = dat), 
      lm(Y ~ Z, data = dat))

## ------------------------------------------------------------------------
N <- 100
# two-arm trial, treat 50 of 100
declaration <- declare_ra(N = N)
X <- rnorm(N)
Z <- conduct_ra(declaration)
Y <- .9 * .2 * Z + .1 * X + -.5 * Z * X + rnorm(N)
dat <- data.frame(X, Y, Z)

# Observed ATE
ate_hat <- coef(lm(Y ~ Z, data = dat))[2]
ate_hat

ri2_out <-
  conduct_ri(
    model_1 = Y ~ Z + X, # restricted model
    model_2 = Y ~ Z + X + Z*X, # unrestricted model
    declaration = declaration,
    sharp_hypothesis = ate_hat,
    data = dat
  )

plot(ri2_out)
summary(ri2_out)

# for comparison
anova(lm(Y ~ Z + X, data = dat),
      lm(Y ~ Z + X + Z*X, data = dat))

## ------------------------------------------------------------------------
N <- 100
declaration <- declare_ra(N = N, m = 50)

Z <- conduct_ra(declaration)
Y <- .9 + rnorm(N, sd = .25 + .25*Z)
dat <- data.frame(Y, Z)

# arbitrary function of data
test_fun <- function(data) {
  with(data, var(Y[Z == 1]) - var(Y[Z == 0]))
}

# confirm it works
test_fun(dat)

ri2_out <-
conduct_ri(
  test_function = test_fun,
  declaration = declaration,
  assignment = "Z",
  outcome = "Y",
  sharp_hypothesis = 0,
  data = dat
)

plot(ri2_out)
summary(ri2_out)


## ------------------------------------------------------------------------
N <- 100
declaration <- declare_ra(N = N)

dat <-
  data.frame(
  X1 = rnorm(N),
  X2 = rbinom(N, 1, .5),
  X3 = rpois(N, 3),
  Z = conduct_ra(declaration)
  )
  
balance_fun <- function(data) {
  summary(lm(Z ~ X1 + X2 + X3, data = data))$f[1]
}

# Confirm it works!
balance_fun(dat)

ri2_out <-
  conduct_ri(
  test_function = balance_fun,
  declaration = declaration,
  assignment = "Z",
  sharp_hypothesis = 0,
  data = dat
  )

plot(ri2_out)
summary(ri2_out)

# For comparison
summary(lm(Z ~ X1 + X2 + X3, data = dat))

