library(testthat)

context("utils")

models_fn <- tempfile()

setup({
    library(mstate)
    library(flexsurv)
    
    data(ebmt3)
    tmat <- trans.illdeath()
    long <- msprep(time=c(NA, 'prtime', 'rfstime'), 
                   status=c(NA, 'prstat', 'rfsstat'), 
                   data=ebmt3, 
                   trans=tmat, 
                   keep=c('age', 'dissub'))
    models <- lapply(1:3, function(i) {
        flexsurvreg(Surv(time, status) ~ age + dissub, data=long, dist='weibull')
    })
    newdata <- data.frame(age="20-40", dissub="AML")
    
    saveRDS(models, models_fn)
})

teardown({
    unlink(models_fn)
})

test_that("validate_oldage correctly identifies errors", {
    newd <- data.frame(age=c(50, 70),
                       sex=c('M', 'F'))
    expect_error(validate_oldage("203", "age", newd),
                 "Error: If agelimit is provided it must be a positive numerical value.")
    expect_error(validate_oldage(-203, "age", newd),
                 "Error: If agelimit is provided it must be a positive numerical value.")
    expect_error(validate_oldage(203, "Age", newd),  
                 "Error: agecol 'Age' not found in newdata")
    expect_equal(validate_oldage(203, "age", newd), TRUE)    
    expect_equal(validate_oldage(FALSE, "age", newd), TRUE)  
})

test_that("get_covariates returns correct covariate names", {
    models <- readRDS(models_fn)
    
    ret <- get_covariates(models)
    expect_equal(typeof(ret), 'character')
    expect_equal(ret, c('age', 'dissub'))
    expect_error(get_covariates(NULL), "Error: must provide a list of flexsurvreg objects.")
    expect_error(get_covariates(list(3, 4)), "Error: must provide a list of flexsurvreg objects.")
})

test_that("get_sink_states correctly returns sink states", {
    tmat <- trans.illdeath()
    
    expect_equal(get_sink_states(tmat), "death")
    expect_error(get_sink_states(NULL), "Error: must provide a square transition matrix.")
    
    df_tmat <- data.frame(healthy=NA, illness=c(1, NA, NA), death=c(2, 3, NA))
    row.names(df_tmat) <- c('healthy', 'illness', 'death')
    expect_error(get_sink_states(df_tmat), 
                 "Error: must provide a square transition matrix.")
    
    # This is illness death with an additional sink state that is included as a source but not
    # a destination
    mat_nonsquare <- matrix(c(NA, NA, NA, NA, 1, NA, NA, NA, 2, 3, NA, NA),
                            ncol=3, nrow=4)
    expect_error(get_sink_states(mat_nonsquare), 
                 "Error: must provide a square transition matrix.")
    
    # Save as above but with a destination and not a source
    mat_nonsquare <- matrix(c(NA, 1, 2, NA, NA, NA, 3, NA, rep(NA, 4)),
                            ncol=4, nrow=3, byrow = T)
    expect_error(get_sink_states(mat_nonsquare), 
                 "Error: must provide a square transition matrix.")
    
    # Now add additional sink and confirm
    mat_square <- matrix(c(NA, 1, 2, NA, NA, NA, 3, NA, rep(NA, 8)),
                         ncol=4, nrow=4, byrow = T)
    colnames(mat_square) <- c('healthy', 'illness', 'death', 'censored')
    rownames(mat_square) <- c('healthy', 'illness', 'death', 'censored')
    expect_equal(get_sink_states(mat_square), c('death', 'censored'))
    
    expect_equal(get_sink_states(trans.comprisk(3)),
                 paste0("cause", 1:3))
    expect_equal(get_sink_states(trans.comprisk(5)),
                 paste0("cause", 1:5))
})

test_that("get_state_entries returns correct values", {
    expect_equal(get_state_entries(seq(5)), seq(4))
    expect_equal(get_state_entries(seq(100)), seq(99))
})

test_that("get_visited_states returns correct values", {
    tmat <- trans.illdeath()
    expect_equal(get_visited_states(1, tmat), 1:3)
    expect_equal(get_visited_states(2, tmat), 2:3)
    expect_equal(get_visited_states(3, tmat), 3:3)
    
    expect_error(get_visited_states(-1, tmat), "Error: start must be an integer in range 1:3.")
    expect_error(get_visited_states(4, tmat), "Error: start must be an integer in range 1:3.")
    expect_error(get_visited_states("test", tmat), "Error: start must be an integer in range 1:3.")
    
})

test_that("validate_starting_state correctly validates", {
    tmat <- trans.illdeath()
    expect_equal(validate_starting_state(1, tmat), 1)
    expect_equal(validate_starting_state(2, tmat), 2)
    expect_equal(validate_starting_state(3, tmat), 3)
    expect_error(validate_starting_state(-1, tmat),
                 "Error: if providing an integer for start_state ensure that it is in the range 1:3.")
    expect_error(validate_starting_state(4, tmat),
                 "Error: if providing an integer for start_state ensure that it is in the range 1:3.")
    expect_error(validate_starting_state(4.2, tmat),
                 "Error: start_state must be an integer or the name of a state.")
    expect_error(validate_starting_state("nonexistant", tmat),
                 "Error: starting state 'nonexistant' not found in trans_mat.")
    
})

test_that("obtain_individual_starting_states returns sensible values", {
    tmat <- trans.illdeath()
    
    expect_error(obtain_individual_starting_states(tmat, -1, 2), 
                 "Error: ninds and nreps must be positive integers.")
    expect_error(obtain_individual_starting_states(tmat, "foo", 2), 
                 "Error: ninds and nreps must be positive integers.")
    expect_error(obtain_individual_starting_states(tmat, 2.5, 2), 
                 "Error: ninds and nreps must be positive integers.")
    expect_error(obtain_individual_starting_states(tmat, 0, 2), 
                 "Error: ninds and nreps must be positive integers.")
    expect_error(obtain_individual_starting_states(tmat, 2, -1), 
                 "Error: ninds and nreps must be positive integers.")
    expect_error(obtain_individual_starting_states(tmat, 2, "foo"), 
                 "Error: ninds and nreps must be positive integers.")
    expect_error(obtain_individual_starting_states(tmat, 2, 2.5), 
                 "Error: ninds and nreps must be positive integers.")
    expect_error(obtain_individual_starting_states(tmat, 2, 0), 
                 "Error: ninds and nreps must be positive integers.")
    
    expect_error(obtain_individual_starting_states(tmat, 2, -1))
    expect_error(obtain_individual_starting_states(tmat, 2, "foo"))
    expect_error(obtain_individual_starting_states(tmat, 2, 2.5))
    
    
    # Check that length is always correct
    expect_equal(length(obtain_individual_starting_states(tmat, 1, 5)), 1*5)
    expect_equal(length(obtain_individual_starting_states(tmat, 2, 5)), 2*5)
    expect_equal(length(obtain_individual_starting_states(tmat, 100, 5)), 100*5)
    expect_equal(length(obtain_individual_starting_states(tmat, 1, 3)), 1*3)
    expect_equal(length(obtain_individual_starting_states(tmat, 2, 3)), 2*3)
    expect_equal(length(obtain_individual_starting_states(tmat, 100, 3)), 100*3)
    
    # Test that always have at least one in starting state for each replication
    expect_equal(sum(obtain_individual_starting_states(tmat, 1, 5) == 3), 1)
    expect_equal(sum(obtain_individual_starting_states(tmat, 2, 5) == 3), 2)
    expect_equal(sum(obtain_individual_starting_states(tmat, 100, 5) == 3), 100)
    expect_equal(sum(obtain_individual_starting_states(tmat, 1, 3) == 3), 1)
    expect_equal(sum(obtain_individual_starting_states(tmat, 2, 3) == 3), 2)
    expect_equal(sum(obtain_individual_starting_states(tmat, 100, 3) == 3), 100)
    
    # Check values are all in correct range
    check_vals <- function(ninds, nreps) {
        foo <- obtain_individual_starting_states(tmat, ninds, nreps)
        all(foo <= 3, foo >= 1)
    }
    expect_true(check_vals(1, 3))
    expect_true(check_vals(2, 3))
    expect_true(check_vals(5, 3))
    expect_true(check_vals(1, 100))
    expect_true(check_vals(3, 125))
    expect_true(check_vals(10, 125))
})

test_that("clean_newdata returns correct columns", {
    models <- readRDS(models_fn)
    
    newdata_wrongcols <- data.frame(disease="AML", agegroup="20-40")
    expect_error(clean_newdata(newdata_wrongcols, models, FALSE, 'age'), 
                 "Error: missing columns age, dissub in newdata.")
    
    newdata_wrongage <- data.frame(age="20-40", dissub="AML")
    expect_error(clean_newdata(newdata_wrongage, models, 3125, 'age_cont'), 
                 "Error: missing columns age_cont in newdata.")
    
    newdata <- data.frame(age="20-40", dissub="AML")
    expect_equal(clean_newdata(newdata, models, FALSE, "foo"), cbind(newdata, list(id=0)))
    
})

test_that("form_model_matrix returns a matrix", {
    models <- readRDS(models_fn)
    
    newdata <- data.frame(age="20-40", dissub="AML")
    out <- form_model_matrix(newdata, models)
    expect_equal(class(out), "matrix")
    expect_equal(colnames(out), c('(Intercept)', 'age20-40', 'age>40', 'dissubALL', 'dissubCML'))
    expect_equal(all(out == c(1, 1, 0, 0, 0)), TRUE)
})

test_that("obtain_model_coef returns correct coefficients", {
    models <- readRDS(models_fn)
    
    newdata <- data.frame(age="20-40", dissub="AML")
    mod <- models[[1]]
    mat <- form_model_matrix(newdata, models)
    out <- obtain_model_coef(mod, mat)
    
    expect_equal(out$name, "weibull")
    expect_equal(length(out$coefs), 2)
    expect_equal(out$coefs[[1]][[1]], seq(0, 4))
    expect_equal(out$coefs[[1]][[2]], unname(coef(mod)[2:6]))
    expect_equal(out$coefs[[2]][[1]], 0)
    expect_equal(out$coefs[[2]][[2]], unname(coef(mod)[1]))
    
    set.seed(17)
    out_m2 <- obtain_model_coef(mod, mat, M=3)
    expect_equal(length(out_m2), 3)
    expect_equal(all(sapply(out_m2, function(x) x$name) == 'weibull'), TRUE)
    expect_equal(all(sapply(out_m2, function(x) x$coefs[[1]][[1]]) == seq(0, 4)), TRUE)
})

test_that("coefs_as_list returns correct list", {
    models <- readRDS(models_fn)
    
    newdata <- data.frame(age="20-40", dissub="AML")
    mod <- models[[1]]
    mat <- form_model_matrix(newdata, models)
    out <- coefs_as_list(mod$coefficients, c('scale', 'shape'),
                         mod$mx, colnames(mat), "weibull")
    
    expect_equal(out$name, "weibull")
    expect_equal(length(out$coefs), 2)
    expect_equal(out$coefs[[1]][[1]], seq(0, 4))
    expect_equal(out$coefs[[1]][[2]], unname(coef(mod)[2:6]))
    expect_equal(out$coefs[[2]][[1]], 0)
    expect_equal(out$coefs[[2]][[2]], unname(coef(mod)[1]))
})