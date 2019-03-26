library(rprev)
context('Cure models')
data(prevsim)

test_that("validate_population_survival identifies error when age is missing", {
    noage <- data.frame(age_days=1:36525, surv=runif(36525))
    wage <- data.frame(age=1:36525, surv=runif(36525))
    missing_agereg <- data.frame(time=runif(50, 0, 3000),
                                 status=sample(c(0, 1), 50, replace=T),
                                 age_years = rnorm(50, 60, 10),
                                 sex=as.factor(sample(c(0, 1), 50, replace=T)))

    expect_error(validate_population_survival(noage, prevsim),
                   "Error: no 'age' column found in population survival rates 'daily_survival'.")
    # Check works when add age back
    expect_silent(validate_population_survival(wage, prevsim))

    # Test when registry data is missing age
    expect_error(fixed_cure(Surv(time, status) ~ age_years + sex, missing_agereg, 3*365.25),
                 "Error: no 'age' column found in registry data frame 'data'.")
})

test_that("validate_population_survival validates surv column", {
    nosurv <- data.frame(age_days=1:36525, prob=runif(36525))
    surv_too_small <- data.frame(age_days=1:36525, surv=runif(36525, -1, 1))
    surv_too_large <- data.frame(age_days=1:36525, surv=runif(36525, 0, 2))

    expect_error(validate_population_survival(nosurv, prevsim),
                 "Error: no 'surv' column found in population survival rates 'daily_survival'.")
    expect_error(validate_population_survival(surv_too_small, prevsim),
                 "Error: population survival probabilities found in 'surv' are out of the range \\[0,1\\].")
    expect_error(validate_population_survival(surv_too_large, prevsim),
                 "Error: population survival probabilities found in 'surv' are out of the range \\[0,1\\].")
})

test_that("validate_population_survival checks the existence of other stratification variables in both data sets", {
    nosex <- data.frame(age=1:36525, surv=runif(36525))
    wsex <- data.frame(age=1:36525, surv=runif(36525), sex=as.factor(sample(c(0, 1), 36525, replace=T)))
    missing_sexreg <- data.frame(time=runif(50, 0, 3000),
                                 status=sample(c(0, 1), 50, replace=T),
                                 age= rnorm(50, 60, 10))

    # Missing from population
    expect_error(validate_population_survival(nosex, prevsim, "sex"),
                 "Error: not all values in population_covariates are in 'daily_survival'. Missing sex")

    # Missing from registry
    expect_error(validate_population_survival(wsex, missing_sexreg, "sex"),
                 "Error: not all values in population_covariates are in 'data'. Missing sex")

    # Check works when add age back
    expect_silent(validate_population_survival(wsex, prevsim))
})

test_that("validate_population_survival verifies all linkage covariate values in registry data are in the population data set", {
    data("UKmortality")
    no_female_pop <- data.frame(age=1:36525, surv=runif(36525), sex='M')
    sex_as_int <- data.frame(time=runif(50, 0, 3000),
                             sex=sample(c(0, 1), 50, replace=T),
                             age= rnorm(50, 60, 10),
                             status=sample(c(0, 1), 50, replace=T))

    # Wrongly encoded sex, as sex as M/F in population registry
    expect_error(validate_population_survival(UKmortality, sex_as_int, "sex"),
                 "Error: not all values of sex are present in population survival.")

    # Missing level. prevsim as M/F and test here has just M
    expect_error(validate_population_survival(no_female_pop, prevsim, "sex"),
                 "Error: not all values of sex are present in population survival.")

})
