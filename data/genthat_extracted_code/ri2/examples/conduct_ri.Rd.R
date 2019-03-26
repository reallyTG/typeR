library(ri2)


### Name: conduct_ri
### Title: Conduct Randomization Inference
### Aliases: conduct_ri

### ** Examples


# Data from Gerber and Green Table 2.2


# Randomization Inference for the Average Treatment Effect

table_2.2 <-
    data.frame(d = c(1, 0, 0, 0, 0, 0, 1),
               y = c(15, 15, 20, 20, 10, 15, 30))

## Declare randomization procedure
declaration <- declare_ra(N = 7, m = 2)

## Conduct Randomization Inference
out <- conduct_ri(y ~ d,
                      declaration = declaration,
                      assignment = "d",
                      sharp_hypothesis = 0,
                      data = table_2.2)

summary(out)
plot(out)
tidy(out)

# Randomization Inference for an Interaction


N <- 100
declaration <- randomizr::declare_ra(N = N, m = 50)

Z <- randomizr::conduct_ra(declaration)
X <- rnorm(N)
Y <- .9 * X + .2 * Z + 1 * X * Z + rnorm(N)
dat <- data.frame(Y, X, Z)

ate_obs <- coef(lm(Y ~ Z, data = dat))[2]

out <-
  conduct_ri(
    model_1 = Y ~ Z + X,
    model_2 = Y ~ Z + X + Z * X,
    declaration = declaration,
    assignment = "Z",
    sharp_hypothesis = ate_obs,
    data = dat, sims = 100
  )

plot(out)
summary(out)

summary(out, p = "two-tailed")
summary(out, p = "upper")
summary(out, p = "lower")

tidy(out)

# Randomization Inference for arbitrary test statistics

## In this example we're conducting a randomization check (in this case, a balance test).

N <- 100
declaration <- randomizr::declare_ra(N = N, m = 50)

Z <- randomizr::conduct_ra(declaration)
X <- rnorm(N)
Y <- .9 * X + .2 * Z + rnorm(N)
dat <- data.frame(Y, X, Z)

balance_fun <- function(data) {
    f_stat <- summary(lm(Z ~ X, data = data))$f[1]
    names(f_stat) <- NULL
    return(f_stat)
}

## confirm function works as expected
balance_fun(dat)

## conduct randomization inference

out <-
  conduct_ri(
    test_function = balance_fun,
    declaration = declaration,
    assignment = "Z",
    sharp_hypothesis = 0,
    data = dat, sims = 100
  )

plot(out)
summary(out)
tidy(out)




