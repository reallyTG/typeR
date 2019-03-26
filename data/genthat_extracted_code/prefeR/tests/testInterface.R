# Validate basic extraction
expect_equal(prefEl(data = c(0,1))$data, c(0,1))

# Validate preference constructors
expect_equal(prefeR::`%>%`(1,2)[[1]], 1) # No comparison op for strict class
expect_equal(prefeR::`%>%`(1,2)[[2]], 2)
expect_equal(prefeR::`%<%`(1,2)[[1]], 2)
expect_equal(prefeR::`%<%`(1,2)[[2]], 1)
expect_equal(prefeR::`%=%`(1,2)[[1]], 1) 
expect_equal(prefeR::`%=%`(1,2)[[2]], 2)
expect_is(prefeR::`%<%`(1,2), c("list","strict"))
expect_is(prefeR::`%<%`(1,2), c("list","strict"))
expect_is(prefeR::`%=%`(1,2), c("list","indif"))

# Preference adders
s <- prefeR::`%>%`(1,2)
p <- prefEl(data = iris)
expect_error(p$addPref("foo"))
p$addPref(s)
expect_equal(p$strict[[1]], s)
s <- prefeR::`%=%`(1,2)
p$addPref(s)
expect_equal(p$indif[[1]], s)
expect_error(p$addPref(prefeR::`%>%`("foo", "bar")))

# Prior helper functions
expect_equal(Exp(2.0)(1.0), dexp(1.0, 1.0/2, log = TRUE))
expect_equal(Exp(2.0)(1.0), Exp(-2.0)(-1.0))
expect_equal(Normal(0.0,1.0)(1.0), dnorm(1.0, log = TRUE))
expect_equal(Flat()(1), 0.0)
expect_is(Exp(2.0), c("prior", "Exp"))
expect_is(Normal(0,1), c("prior", "Normal"))
expect_is(Flat(), c("prior", "Flat"))

# Ranker
p <- prefEl(data = data.frame(x = c(1, 0, 1), 
                              y = c(0, 1, 1)),
            priors = c(Normal(), Normal()))

p$addPref(prefeR::`%>%`(1, 3))
p$addPref(prefeR::`%>%`(1, 2))
expect_equivalent(order(p$rank()), c(3, 2, 1))
