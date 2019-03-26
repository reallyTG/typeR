context("Exception Handling")

test_that("NAs returned on invalid input", {
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    for(case in 1:length(lows)) {
        suppressWarnings({
            expect_true(all(is.na(etn(.mean = c(Inf, -Inf),
                                      .sd = rep(1, 2),
                                      .low = rep(lows[case], 2),
                                      .high = rep(highs[case], 2)
                                      )
                                  )
                            )
                        )
            expect_true(all(is.na(etn(.mean = rep(0, 4),
                                      .sd = c(0, -1, -Inf, Inf),
                                      .low = rep(lows[case], 4),
                                      .high = rep(highs[case], 4)
                                      )
                                  )
                            )
                        )
            expect_true(all(is.na(etn(.mean = rep(0, 4),
                                      .sd = rep(1, 4),
                                      .low = rep(highs[case], 4),
                                      .high = rep(lows[case], 4)
                                      )
                                  )
                            )
                        )
        }
                         )
    }
}
          )


test_that("Errors Thrown on Badly Sized Inputs", {
    ## RTN
    expect_equal(tryCatch(rtn(.mean = rep(0, 2)[1],
                              .sd = rep(1, 2),
                              .low = rep(-1, 2),
                              .high = rep(2, 2)
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )
    expect_equal(tryCatch(rtn(.mean = rep(0, 2),
                              .sd = rep(1, 2)[1],
                              .low = rep(-1, 2),
                              .high = rep(2, 2)
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )
    expect_equal(tryCatch(rtn(.mean = rep(0, 2),
                              .sd = rep(1, 2),
                              .low = rep(-1, 2)[1],
                              .high = rep(2, 2)
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )
    expect_equal(tryCatch(rtn(.mean = rep(0, 2),
                              .sd = rep(1, 2),
                              .low = rep(-1, 2),
                              .high = rep(2, 2)[1]
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )

    ## ETN
    expect_equal(tryCatch(etn(.mean = rep(0, 2)[1],
                              .sd = rep(1, 2),
                              .low = rep(-1, 2),
                              .high = rep(2, 2)
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )
    expect_equal(tryCatch(etn(.mean = rep(0, 2),
                              .sd = rep(1, 2)[1],
                              .low = rep(-1, 2),
                              .high = rep(2, 2)
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )
    expect_equal(tryCatch(etn(.mean = rep(0, 2),
                              .sd = rep(1, 2),
                              .low = rep(-1, 2)[1],
                              .high = rep(2, 2)
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )
    expect_equal(tryCatch(etn(.mean = rep(0, 2),
                              .sd = rep(1, 2),
                              .low = rep(-1, 2),
                              .high = rep(2, 2)[1]
                              ),
                          error = function(e) 1,
                          finally = 0
                          ),
                 1
                 )

}
          )
