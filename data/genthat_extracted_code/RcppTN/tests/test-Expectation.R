context("Expectation Calculation")

test_that("Expectations are symmetric", {
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    for(case in 1:length(lows)) {
        out1 <- etn(.mean = 0,
                    .low = lows[case],
                    .high = highs[case]
                    )
        out2 <- etn(.mean = 0,
                    .high = -lows[case],
                    .low = -highs[case]
                    )
        expect_true((out1 + out2) < .01)
    }
}
          )

test_that("Extreme expectation are defined.", {
    means <- seq(0, -37, by = -1)
    for (case in 1:length(means)) {
        out1 <- etn(.mean = means[case],
                    .low = 0,
                    .high = Inf
                    )
        expect_true(is.finite(out1))
    }
    means <- seq(0, 37, by = 1)
    for (case in 1:length(means)) {
        out1 <- etn(.mean = means[case],
                    .low = -Inf,
                    .high = 0
                    )
        expect_true(is.finite(out1))
    }

}
          )
