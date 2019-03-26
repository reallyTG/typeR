#    expect_that( , is_identical_to(  ))
#    make_expectation( , "is_identical_to")

test_that("mcSpec works correctly", {


    expect_that(
        mcSpec(dim = 5, mo = 4, root1 = c(1,1), order = rep(3,4)),
        equals_reference("mcSpec_5_d4_1_1__3_4")
        )

    expect_that(
        mcSpec(dim = 5, mo = 4, root1 = c(1,1,1), order = rep(5,4)),
        equals_reference("mcSpec_5_d4_1_1_1__5_4")
        )


    expect_that(mcSpec(dim = 5, mo = 4, root1 = c(1,1,1,1), order = rep(5,4))  ,
        equals_reference("mcSpec_d4_1_1_1_1__5_4")
        )


    expect_that(mcSpec(dim = 5, mo = 4, root1 = c(2,1,1,1), order = rep(5,4))  ,
        equals_reference("mcSpec_5_d4_2_1_1_1__5_4")
        )


    expect_that(mcSpec(dim = 5, mo = 4, root1 = c(2,2,1,1), order = rep(5,4))  ,
                throws_error()
                )


    expect_that(mcSpec(dim = 5, mo = 4, root1 = c(2,2,1,1), order = rep(6,4)),
                throws_error()
        )


    expect_that(mcSpec(dim = 7, mo = 4, root1 = c(2,2,1,1), order = rep(5,4))  ,
        # equals_reference("mcSpec_7_d4_2_2_1_1__5_4")
                throws_error()

                )


    expect_that(mcSpec(dim = 8, mo = 4, root1 = c(2,2,1,1), order = rep(5,4))  ,
        # equals_reference("mcSpec_8_d4_2_2_1_1__5_4")
                throws_error()
        )


    expect_that(mcSpec(dim = 10, mo = 4, root1 = c(2,2,1,1), order = rep(1,4)) ,
        #equals_reference("mcSpec_10_d4_2_2_1_1__1_4")
                throws_error()
        )


    expect_that(mcSpec(dim = 10, mo = 4, root1 = c(2,2,1,1), order = rep(2,4)) ,
        #equals_reference("mcSpec_10_d4_2_2_1_1__2_4")
                 throws_error()
       )

    ## TODO: The result does not seem correct.
    ##       Shouldn't ev.type be    "r"  "r"  "r"            "r"  "cp" "cp"
    ##       rather than             "r"  "r"  "r"  "r"  "r"  "r"  "cp" "cp"
    expect_that(mcSpec(dim = 10, mo = 4, root1 = c(2,2,1), order = rep(8,4)) ,
        equals_reference("mcSpec_10_d4_2_2_1__8_4")
        )

})


