library(rprev)
context('Survival model')
data(prevsim)

test_that("Incorrectly specified inputs are correctly handled", {

    test_form <- function(form, dist) {
        build_survreg(form, prevsim, dist)
    }

    # Test that if provide columns that don't exist an error is thrown
    expect_error(test_form(Surv(stime, status) ~ 1, 'weibull'))
    expect_error(test_form(Surv(time, stat) ~ 1, 'weibull'))
    expect_error(test_form(Surv(time, status) ~ ageDiag, 'weibull'))

    # Test incorrectly specified distributions
    expect_error(test_form(Surv(time, status) ~ 1, 'exp'))
    expect_error(test_form(Surv(time, status) ~ age, 'wei'))
    expect_error(test_form(Surv(time, status) ~ sex, 'lnorm'))
    expect_error(test_form(Surv(time, status) ~ age + sex, 'llog'))
    expect_error(test_form(Surv(time, status) ~ age + sex, 'gamma'))
})

test_that("Models are build with correctly specified arguments", {

    test_mod <- function(form, dist) {
        expect_error(mod <- build_survreg(form, prevsim, dist), regexp = NA)
        expect_identical(class(mod), c('list', 'survregmin'))
        expect_true(all(is.finite(mod$coefs)))
    }

    # Test that if provide columns that don't exist an error is thrown
    test_mod(Surv(time, status) ~ 1, 'weibull')
    test_mod(Surv(time, status) ~ 1, 'lognormal')
    test_mod(Surv(time, status) ~ 1, 'exponential')

    test_mod(Surv(time, status) ~ age, 'weibull')
    test_mod(Surv(time, status) ~ age, 'lognormal')
    test_mod(Surv(time, status) ~ age, 'exponential')

    test_mod(Surv(time, status) ~ sex, 'weibull')
    test_mod(Surv(time, status) ~ sex, 'lognormal')
    test_mod(Surv(time, status) ~ sex, 'exponential')

    test_mod(Surv(time, status) ~ sex + age, 'weibull')
    test_mod(Surv(time, status) ~ sex + age, 'lognormal')
    test_mod(Surv(time, status) ~ sex + age, 'exponential')
})

test_that("predict_survival_probability handles incorrectly specified arguments", {
    mod <- build_survreg(Surv(time, status) ~ sex + age, prevsim, 'weibull')
    newdata_clean <- prevsim[sample(1:nrow(prevsim), replace=T), ]

    expect_error(predict_survival_probability(mod, newdata_clean[1:100, ], times=c(5, 3, 2)))  # newdata_clean and times have different lengths
    expect_warning(predict_survival_probability(mod, newdata_clean[1:5, ], times=c(-1, 3, -10, 3, 2))) # Negative times should give warning

    expect_error(predict_survival_probability(mod,
                                 newdata_clean[1:5, !(names(newdata_clean) %in% c('age'))],
                                 times=c(100, 502, 250, 32, 520))) # Should get error if pass data frame without required covariates
    expect_error(predict_survival_probability(mod,
                                 newdata_clean[1:5, !(names(newdata_clean) %in% c('sex'))],
                                 times=c(100, 502, 250, 32, 520))) # Should get error if pass data frame without required covariates
    expect_error(predict_survival_probability(mod,
                                 newdata_clean[1:5, !(names(newdata_clean) %in% c('sex', 'age'))],
                                 times=c(100, 502, 250, 32, 520))) # Should get error if pass data frame without required covariates


})

test_that("predict_survival_probability produces correct survival estimates", {

    # For this test, a "correct" survival estimate is provided by the flexsurv
    # package which is a wrapper around survreg. Since survreg doesn't provide a
    # function for calculating S(t) from a model, I'd have to write my own implementation
    # which is essentially what I've done for predict_survival_probability.survregmin
    # so I'd be comparing two of my own implementations against each other. It makes more
    # sense to test against flexsurv
    test_surv <- function(form, dist, newdata, time) {
        mod <- build_survreg(form, prevsim, dist)
        flexmod <- flexsurv::flexsurvreg(form, data=prevsim, dist=dist)

        survregmin_pred <- as.numeric(predict_survival_probability(mod, newdata, time))

        # Need ugly lapply here as by default flexsurv creates estimate for each individual for each t
        ndataflex <- if (nrow(newdata) == 0) NULL else newdata
        flexsurv_raw <- summary(flexmod, newdata=ndataflex, t=time)
        flexsurv_pred <- as.numeric(unlist(lapply(1:length(time), function(t) flexsurv_raw[[t]][t, ][2])))

        expect_equal(survregmin_pred, flexsurv_pred)
    }

    # build models on all combinations of covars and dists
    test_surv(Surv(time, status) ~ 1, 'weibull', data.frame(), time=500)
    test_surv(Surv(time, status) ~ 1, 'lognormal', data.frame(), time=58)
    test_surv(Surv(time, status) ~ 1, 'exponential', data.frame(), time=40)

    test_surv(Surv(time, status) ~ age, 'weibull', data.frame(age=30), time=500)
    test_surv(Surv(time, status) ~ age, 'lognormal', data.frame(age=50), time=58)
    test_surv(Surv(time, status) ~ age, 'exponential', data.frame(age=c(70, 84)), time=c(40, 60))

    test_surv(Surv(time, status) ~ sex, 'weibull', data.frame(sex=factor(c('F', 'M'), levels=levels(prevsim$sex))), time=c(1000, 232))
    test_surv(Surv(time, status) ~ sex, 'lognormal', data.frame(sex=factor('M', levels=levels(prevsim$sex))), time=58)
    test_surv(Surv(time, status) ~ sex, 'exponential', data.frame(sex=factor(c('M', 'F'), levels=levels(prevsim$sex))), time=c(40, 60))

    test_surv(Surv(time, status) ~ sex + age, 'weibull', data.frame(age=50, sex=factor('M', levels=levels(prevsim$sex))), time=423)
    test_surv(Surv(time, status) ~ sex + age,
              'lognormal',
              data.frame(age=rnorm(3, 60, 20),
                         sex=factor(c('F', 'M', 'M'), levels=levels(prevsim$sex))),
              time=c(10, 232, 5000))
    test_surv(Surv(time, status) ~ sex + age, # Test on 23 patients
              'exponential',
              data.frame(age=rnorm(23, 80, 10),
                         sex=factor(sample(c('M', 'F'), 23, replace=T), levels=levels(prevsim$sex))),
              time=runif(23, 0, 4000))
})
