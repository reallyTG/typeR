library(rprev)
context('Incidence model')
data(prevsim)

generate_df <- function(startdate, rates, n_inds=10000) {
    # Generate stratified entry date
    df <- data.frame()
    if (is.null(dim(rates))) {
        ngroups <- 1
        rates <- t(rates)
    } else {
        ngroups <- length(dim(rates))
    }

    for (i in seq(ngroups)) {
        this_group <- rates[i, ]
        for (r in seq_along(this_group)) {
            entrydates <- as.Date(startdate) + cumsum(rexp(n_inds, this_group[r]))
            this_row <- data.frame(entrydates, LETTERS[r])
            if (ngroups == 2) {
               this_row <- cbind(this_row, LETTERS[i])
            }
            df <- rbind(df, this_row)
        }
    }
    # Shuffle df
    colnames(df) <- c('entry', paste0("group", seq(ngroups)))
    df <- df[sample(1:nrow(df), replace=F), ]
    df[, 2:ncol(df)] <- lapply(df[2:ncol(df)], as.factor)
    df
}


test_that("rate is correctly estimated within 10%", {
    expect_rate <- function(startdate, rate, n_inds=10000) {
        df <- generate_df(startdate, rate, n_inds)
        mod <- fit_exponential_incidence(entry ~ 1, df)
        error <- abs((mod$rate - rate) / rate)
        expect_lte(error, 0.10)
    }
    expect_rate('2004-01-01', 9)
    expect_rate('2005-03-23', 0.5)
    expect_rate('1998-05-17', 0.003)
    expect_rate('1885-09-12', 100)
})

test_that("rate for stratified covariates is correctly estimated within 10%", {
    expect_rate <- function(startdate, rates, n_inds=10000) {
        df <- generate_df(startdate, rates, n_inds)
        # Fit model
        mod <- fit_exponential_incidence(entry ~ group1, df)
        error <- abs((mod$rate$Freq - rates) / rates)
        expect_false(any(error > 0.10))
    }
    expect_rate('2004-01-01', c(0.52, 0.32))
    expect_rate('2005-03-23', c(5, 3))
    expect_rate('1998-05-17', c(0.7, 0.5, 0.4))
    expect_rate('1885-09-12', c(50, 40, 60))
})

test_that("Error is thrown when attempting to stratify by > 1 variable", {
    strata_0 <- generate_df("2011-03-02", 0.5)
    # See https://stackoverflow.com/questions/22003306/is-there-something-in-testthat-like-expect-no-warnings
    # For why regexp=NA tests for no errors
    expect_error(fit_exponential_incidence(entry ~ 1, strata_0), regexp=NA)

    strata_1 <- generate_df("2011-03-02", c(0.5, 0.3))
    expect_error(fit_exponential_incidence(entry ~ group1, strata_1), regexp=NA)

    rates_2 <- matrix(c(0.5, 0.2, 0.8, 0.9), nrow=2, byrow=T)
    strata_2 <- generate_df("2011-03-02", rates_2)
    expect_error(fit_exponential_incidence(entry ~ group1 + group2, strat_2))
})

test_that("The correct class is made", {
    test_class <- function(start, rate, form) {
        df <- generate_df(start, rate)
        mod <- fit_exponential_incidence(form, df)
        expect_identical(class(mod), "expinc")
    }

    test_class("2004-03-05", 0.5, entry ~ 1)
    test_class("2005-01-25", c(0.5, 0.3), entry ~ 1)
    test_class("1988-10-30", c(0.5, 0.3), entry ~ group1)
})

test_that("Incorrect argument specification is correctly handled", {
    test_args <- function(start, rate, form) {
        df <- generate_df(start, rate)
        expect_error(fit_exponential_incidence(form, df))
    }

    test_args("2014-01-01", 0.5, entrydate ~ 1)  # Wrong column name for entry column
    test_args("2014-01-01", c(0.5, 0.3), entry ~ sex)  # Wrong column name for strata (it is group1)
    test_args("2014-01-01", c(0.5, 0.3), entrydate ~ sex)  # Both wrong names
})

test_that("draw_incident_population has correct error handling on inputs", {
    mod <- fit_exponential_incidence(entrydate ~ 1, prevsim)
    bs_df <- prevsim[sample(1:nrow(prevsim), replace=T), ]

    expect_error(draw_incident_population(mod_nostrata, bs_df, -1, NULL))  #  negative time
    expect_error(draw_incident_population(mod_nostrata, bs_df, 500, c("ageDiag")))  #  covar that isn't in data frame
    expect_error(draw_incident_population(mod_nostrata, bs_df, 500, c("sex", "ageDiag")))  #  covar that isn't in data frame
})

test_that("draw_incident_population has correct output dimensions and form", {
    mod_nostrata <- fit_exponential_incidence(entrydate ~ 1, prevsim)
    mod_strata <- fit_exponential_incidence(entrydate ~ sex, prevsim)
    bs_df <- prevsim[sample(1:nrow(prevsim), replace=T), ]

    pop1 <- draw_incident_population(mod_nostrata, bs_df, 1000, NULL)
    pop2 <- draw_incident_population(mod_strata, bs_df, 1000, NULL)
    pop3 <- draw_incident_population(mod_nostrata, bs_df, 1000, 'age')
    pop4 <- draw_incident_population(mod_strata, bs_df, 1000, 'age')

    # Correct column vals
    expect_identical(colnames(pop1), c('time_to_entry'))
    expect_identical(colnames(pop2), c('time_to_entry', 'sex'))
    expect_identical(colnames(pop3), c('time_to_entry', 'age'))
    expect_identical(colnames(pop4), c('time_to_entry', 'sex', 'age'))

    # Correct classes
    expect_true("data.frame" %in% class(pop1))
    expect_true("data.frame" %in% class(pop2))
    expect_true("data.frame" %in% class(pop3))
    expect_true("data.frame" %in% class(pop4))
})

test_that("draw_incident_population has correct incidence rate", {
    mod_nostrata <- fit_exponential_incidence(entrydate ~ 1, prevsim)
    mod_strata <- fit_exponential_incidence(entrydate ~ sex, prevsim)
    bs_df <- prevsim[sample(1:nrow(prevsim), replace=T), ]

    pop1 <- draw_incident_population(mod_nostrata, bs_df, 1e5, NULL)
    pop2 <- draw_incident_population(mod_strata, bs_df, 1e5, NULL)
    pop3 <- draw_incident_population(mod_nostrata, bs_df, 1e5, 'age')
    pop4 <- draw_incident_population(mod_strata, bs_df, 1e5, 'age')

    # Non-stratified models have simple rate calculation
    emp_rate1 <- nrow(pop1) / (max(pop1$time_to_entry) - min(pop1$time_to_entry))
    emp_rate3 <- nrow(pop3) / (max(pop3$time_to_entry) - min(pop3$time_to_entry))
    expect_lte(abs((emp_rate1 - mod_nostrata$rate) / mod_nostrata$rate), 0.10)
    expect_lte(abs((emp_rate3 - mod_nostrata$rate) / mod_nostrata$rate), 0.10)

    # Stratified models have a more involved calculation
    emp_rate2 <- c()
    emp_rate4 <- c()
    for (s in levels(prevsim$sex)) {
        pop2_sub <- pop2[pop2$sex == s, ]
        pop4_sub <- pop4[pop4$sex == s, ]
        emp_rate2 <- c(emp_rate2, nrow(pop2_sub) / (max(pop2_sub$time_to_entry) - min(pop2_sub$time_to_entry)))
        emp_rate4 <- c(emp_rate4, nrow(pop4_sub) / (max(pop4_sub$time_to_entry) - min(pop4_sub$time_to_entry)))
    }
    error2 <- abs((emp_rate2 - mod_strata$rate$Freq) / mod_strata$rate$Freq)
    error4 <- abs((emp_rate4 - mod_strata$rate$Freq) / mod_strata$rate$Freq)
    expect_false(any(error2 > 0.10))
    expect_false(any(error4 > 0.10))
})