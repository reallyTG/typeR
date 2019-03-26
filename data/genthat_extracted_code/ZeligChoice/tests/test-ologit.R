#### Ordered Logistic Regression Tests ####

# REQUIRE TEST Monte Carlo ologit ----------------------------------------------
test_that('REQUIRE TEST Monte Carlo ologit', {
    z <- zologit$new()
    test <- z$mcunit(minx = 0, maxx = 2, plot = FALSE)
    expect_true(test)
})

# REQUIRE TEST ologit doc example ----------------------------------------------
test_that('REQUIRE TEST ologit doc example', {
    data(sanction)
    sanction$ncost <- factor(sanction$ncost, ordered = TRUE,
                         levels = c("net gain", "little effect", "modest loss",
                                    "major loss"))
    z.out <- zelig(ncost ~ mil + coop, model = "ologit", data = sanction)
    x.out <- setx(z.out)
    s.out <- sim(z.out, x = x.out)
    expect_equal(names(s.out$sim.out[[1]]), c('ev', 'pv'))
})
