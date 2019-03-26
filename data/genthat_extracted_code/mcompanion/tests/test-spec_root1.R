#    expect_that( , is_identical_to(  ))
#    make_expectation( , "is_identical_to")

test_that("spec_root1 works correctly", {

    expect_that(spec_root1(4, iorder = 1),
                is_identical_to( spec_root1(4, root1 = 1) ))

    expect_that(spec_root1(4, iorder = 1),
                is_identical_to( spec_root1(4, root1 = c(1,0,0,0)) ))


    expect_that(spec_root1(4, siorder = 1),
                is_identical_to( spec_root1(4, root1 = c(1,1,1,1)) ))

    expect_that(spec_root1(4, siorder = 2),
                is_identical_to( spec_root1(4, root1 = c(2,2,2,2)) ))


    expect_that(spec_root1(4, iorder = 1, siorder = 1),
                is_identical_to( spec_root1(4, root1 = c(2,1,1,1)) ))


    # make_expectation(spec_root1(4, root1 = c(2,1)), "is_identical_to")
    expect_that(spec_root1(4, root1 = c(2, 1)),
                is_identical_to(structure(list(
                    mo = 4, ev.type = c("r", "r"), co.type = c("r", "r"), n.root = 3,
                    ev.abs = c(1, 1), ev.arg = c(0, 0), block.length = c(2, 1 ),
                    co.abs = structure(c(NA_real_, NA_real_, NA_real_, NA_real_,
                        NA_real_, NA_real_, NA_real_, NA_real_, NA_real_,
                        NA_real_, NA_real_, NA_real_), .Dim = c(4L, 3L)),
                    co.arg = structure(c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA),
                        .Dim = c(4L, 3L)),
                    co1 = structure(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                        .Dim = c(4L, 3L))), .Names = c("mo", "ev.type", "co.type", "n.root",
                             "ev.abs", "ev.arg", "block.length", "co.abs", "co.arg", "co1"))))

    # make_expectation(spec_root1(4, root1 = c(2,1,1)), "is_identical_to")
    expect_that(spec_root1(4, root1 = c(2, 1, 1)),
                is_identical_to(structure(list(
                    mo = 4, ev.type = c("r", "r", "r"), co.type = c("r", "r", "r"),
                    n.root = 4, ev.abs = c(1, 1, 1), ev.arg = c(0, 0, 0),
                    block.length = c(2, 1, 1), co.abs = structure(c(NA_real_,
                       NA_real_, NA_real_, NA_real_, NA_real_, NA_real_,
                       NA_real_, NA_real_, NA_real_, NA_real_, NA_real_,
                       NA_real_, NA_real_, NA_real_, NA_real_, NA_real_),
                                                   .Dim = c(4L, 4L)),
                    co.arg = structure(c(NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA,
                        NA, NA, NA), .Dim = c(4L, 4L)),

                    co1 = structure(c(NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_, NA_real_,
                        NA_real_, NA_real_), .Dim = c(4L, 4L))), .Names = c("mo", "ev.type", "co.type",
                        "n.root", "ev.abs", "ev.arg", "block.length", "co.abs", "co.arg",
                                                         "co1"))))


})

