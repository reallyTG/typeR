# make_expectation(spec_seeds1(c(1), mo = 4), "is_identical_to")
# make_expectation(spec_seeds1(c(1,1), mo = 4)     , "is_identical_to")
# make_expectation(spec_seeds1(c(1,1,1), mo = 4)   , "is_identical_to")
# make_expectation(spec_seeds1(c(1,1,1,1), mo = 4) , "is_identical_to")
# make_expectation(spec_seeds1(c(2,2,2,2), mo = 4) , "is_identical_to")
# make_expectation(spec_seeds1(c(2,1,1,1), mo = 4) , "is_identical_to")
# make_expectation(spec_seeds1(c(2,1), mo = 4)     , "is_identical_to")

test_that("spec_seeds1 works correctly", {

    expect_that(spec_seeds1(c(1), mo = 4), is_identical_to(structure(c(NA_real_,
                                  NA_real_, NA_real_, NA_real_), .Dim = c(4L, 1L))))

    ## make_expectation(spec_seeds1(c(1,1), mo = 4)     , "is_identical_to")
    expect_that(spec_seeds1(c(1, 1), mo = 4), is_identical_to(structure(c(NA_real_,
                                     NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_), .Dim = c(4L, 2L))))

    ## make_expectation(spec_seeds1(c(1,1,1), mo = 4)   , "is_identical_to")
    expect_that(spec_seeds1(c(1, 1, 1), mo = 4),
                is_identical_to(structure(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                                          .Dim = c(4L, 3L))))
    ## make_expectation(spec_seeds1(c(1,1,1,1), mo = 4) , "is_identical_to")
    expect_that(spec_seeds1(c(1, 1, 1, 1), mo = 4),
                is_identical_to(structure(c(1, 0, 0, 0, 0, 1, 0,
                                            0, 0, 0, 1, 0, 0, 0, 0, 1), .Dim = c(4L, 4L ))))

    ## make_expectation(spec_seeds1(c(2,2,2,2), mo = 4) , "is_identical_to")
    expect_that(spec_seeds1(c(2, 2, 2, 2), mo = 4),
                is_identical_to(structure(c(1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0,
                                            0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
                                          .Dim = c(4L, 8L))))

    ## make_expectation(spec_seeds1(c(2,1,1,1), mo = 4) , "is_identical_to")
    ##   note: this expectation is only for the current implementation,  (:todo:)
    expect_that(spec_seeds1(c(2, 1, 1, 1), mo = 4),
                is_identical_to(
                    ## this was before introducing subspace based parameterisation
                    ## structure(c(NA, NA, NA, NA, 0, 0, 0, 0, NA, NA, NA, NA, NA,
                    ##            NA, NA, NA, NA, NA, NA, NA), .Dim = 4:5)
                    structure(c(-Inf, -Inf, -Inf, -Inf, 0, 0, 0, 0, Inf, Inf, Inf,
                                Inf, Inf, Inf, Inf, Inf, Inf, Inf, Inf, Inf), .Dim = 4:5)
                    )

                )

    ## make_expectation(spec_seeds1(c(2,1), mo = 4)     , "is_identical_to")
    expect_that(spec_seeds1(c(2, 1), mo = 4),
                is_identical_to(structure(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                                          .Dim = c(4L, 3L))))
})

