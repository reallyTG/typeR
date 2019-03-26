context("test-asymmetrise_stats")
library(tibble)
library(broom)
library(dplyr)

test_that("stats asymmetrization works", {
    grps <- c("A", "B", "C")
    n_reps <- 5
    tib <- tibble(grp = rep(grps, n_reps),
                  val = rnorm(n_reps * length(grps)))
    tukey <- TukeyHSD(aov(val ~ grp, data = tib))

    expect_warning(prepare_data(grps))
    expect_true(is_tibble(prepare_data(c())))
    expect_equal(prepare_data(tib), tib)
    expect_s3_class(prepare_data(tukey), "tbl_df")
    expect_true(is_tibble(prepare_data(tukey)))

    expect_equal(nrow(asymmetrise_stats(tukey)), 15)
    expect_equal(nrow(asymmetrize_stats(tukey)), 15)
})
