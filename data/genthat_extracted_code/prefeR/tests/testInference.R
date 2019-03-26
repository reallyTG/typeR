# Basic data for testing
data <- as.matrix(data.frame(x = c(1, 0, 1), 
                             y = c(0, 1, 1)))
priors <-  c(Normal(1, 0.5), 
             Normal(2, 0.5))

p <- prefEl(data = data, priors = priors)

expect_error(p$infer(estimate = "foo"))

expect_equivalent(p$infer(estimate = "MAP"), c(1, 2))

p$priors <- c(Normal(1, 1), 
              Exp(0.5))

expect_equivalent(p$infer(estimate = "MAP"), c(1, 0))

p$priors <- c(Normal(1, 1),
              Exp(-0.5))

expect_equivalent(p$infer(estimate = "MAP"), c(1,0))

# Want to throw errors at indecisive people
p$priors <- c(Flat(), Flat())
expect_error(p$infer())

# Begin testing actual preferneces with MAP estimate
p$priors <- c(Normal(0,1), 
              Normal(0,1))
p$addPref(prefeR::`%>%`(1,3))
est <- p$infer()
expect_gt(est[1], est[2])

p$addPref(prefeR::`%>%`(2,3))
est <- p$infer()
expect_equivalent(est[1], est[2])

p$addPref(prefeR::`%=%`(1,2))
est <- p$infer()
expect_equivalent(est[1], est[2])

p$addPref(prefeR::`%>%`(1,2))
est <- p$infer()
expect_gt(est[1], est[2])

# Test posterior mean estimator too
est <- p$infer(estimate = "mean")
expect_gt(est[1], est[2])

# Test on real dataset
p <- prefEl(data = mtcars)
p$addPref(prefeR::`%>%`("Mazda RX4", "Fiat X1-9"))
p$addPref(prefeR::`%>%`("Mazda RX4", "Mazda RX4 Wag"))
p$priors <- sapply(rep(1.0, 11), Exp)
expect_equal(names(p$rank()[1]), "Cadillac Fleetwood")

# Test single prior addition
data <- as.matrix(data.frame(x = c(1, 0, 1), 
                             y = c(0, 1, 1)))
priors <-  Normal(1, 0.5)

p <- prefEl(data = data, priors = priors)
expect_equivalent(p$infer()[1], 1.0) # ignore row names