library(rprev)
context('Incidence')
data(prevsim)

test_that("mean_incidence_rate returns same values as before", {
    rawinc <- c(50, 42, 60, 70)
    expect_equal(mean_incidence_rate(rawinc, population_size=35e5), list(absolute=55.5,
                                                                         per100K=1.59,
                                                                         per100K.lower=1.48,
                                                                         per100K.upper=1.69))
})

test_that("mean_incidence_rate returns a list", {
    rawinc <- c(50, 42, 60, 70, 80)
    expect_match(typeof(mean_incidence_rate(rawinc, population_size=35e5)), 'list')
})

test_that("mean_incidence_rate returns no NAs", {
    rawinc <- c(50, 42, 60, 70, 80)
    expect_equal(any(is.na(mean_incidence_rate(rawinc, population_size=35e5))), FALSE)
})
