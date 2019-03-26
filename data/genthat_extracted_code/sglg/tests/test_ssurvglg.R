
context("Messages are returned by the ssurvglg() function.")

test_that("test if ssurvglg() returns warning messages.", {
    expect_error(ssurvglg(data = example_sglg, npc = x3), "The formula argument is missing.")
    expect_error(ssurvglg(Surv(log(obst2), delta2) ~ x1 + x2 - 1, npc = x3), 
        "The data argument is missing.")
})

