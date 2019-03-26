test_that("trimmed quantile warnings work",
          {
            expect_warning(trimmed_quantile(1:100, trim = 3.9, prob = 1:23 / 24, name = FALSE))
            expect_warning(trimmed_quantile(1:100, trim = -3.9, prob = 1:23 / 24, name = FALSE))
            expect_equivalent(suppressWarnings(trimmed_quantile(1:100, trim = 3.9, prob = 1:23 / 24, name = FALSE)),
                              quantile(4:97, prob = 1:23 / 24)
                              )
          }) 
