library(rprev)
context('Diagnostics')
data(prevsim)

test_that("test_dispersion correct values", {
    set.seed(17)
    raw_inc <- c(50, 48, 42, 62, 61, 55)
    expect_equal(test_dispersion(raw_inc, N_sim = 20), c(0.25, 0.75))
})

test_that("test_dispersion returns doubles", {
    expect_double <- function(data, N_sim) {
        expect_match(typeof(test_dispersion(c(30, 25, 28, 40, 62), N_sim = 10)), 'double')
    }

    expect_double(incidence(prevsim$entrydate), N_sim = 10)
})

test_that("test_dispersion returns no NAs", {
    expect_NA <- function(data, N_sim) {
        expect_equal(any(is.na(test_dispersion(c(30, 25, 28, 42, 60), N_sim = 10))), FALSE)
    }

    expect_NA(incidence(prevsim$entrydate), N_sim = 10)
})

test_that("test_dispersion returns the correct number of values", {
    expect_length <- function(data, N_sim) {
        expect_equal(length(test_dispersion(c(50, 42, 55, 60, 30), N_sim = 10)),2)
    }

    expect_length(test_dispersion(incidence(prevsim$entrydate), N_sim = 10))
})

test_that("test_prevalence_fit returns same values as before without error and isn't significant", {
    suppressWarnings(RNGversion("3.5.0"))
    set.seed(17)
    prevalence_object <- prevalence("2013-01-01",
                                    num_years_to_estimate=10,
                                    data=prevsim,
                                    inc_formula=entrydate ~ sex,
                                    surv_formula=Surv(time, status) ~ sex + age,
                                    dist='weibull',
                                    death_column='eventdate',
                                    N_boot=20)
    fn <- 'cache/diagnostics/prev_pval.rds'
    expect_equal_to_reference(test_prevalence_fit(prevalence_object), file=fn)
    expect_gt(prevalence_object$pval, 0.05)
    expect_match(typeof(test_prevalence_fit(prevalence_object)), 'double')
    expect_equal(any(is.na(test_prevalence_fit(prevalence_object))), FALSE)
})
