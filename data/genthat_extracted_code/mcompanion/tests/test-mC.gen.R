
test_that("make_mc(g)ev work properly", {
    expect_that(make_mcev(0, c(1,2,3,4), dim = 7)
                , is_identical_to(c(0,0,0,1,2,3,4)) )

    expect_that(make_mcev(0, c(1,2,3,4), dim = 7, what.co = "top")
                , throws_error() )

    expect_that(make_mcgev(0, c(1,2,3,4), v = c(0,0,0,1,2,3,4), what.co = "top")
                , throws_error() )

    expect_that(make_mcgev(0, c(1,2,3,4), v = c(0,0,0,1,2,3,4))
                , is_identical_to(c(2,3,4, 1,2,3,4)) )

})
