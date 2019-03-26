context("Random Number Generation")

test_that("RNG returns correct dimensions", {
    sizes <- c(1, 10, 15, 1000)
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    for(case in 1:length(lows)) {
        for(size in sizes) {
            out <- rtn(.mean = rep(0, size),
                       .low = rep(lows[case], size),
                       .high = rep(highs[case], size)
                       )
            expect_that(length(out), equals(size))
        }
    }
}
          )

test_that("RNG returns correct dimensions with bad inputs", {
    sizes <- c(1, 10, 15, 1000)
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    lows2 <- highs
    highs2 <- lows
    for(case in 1:length(lows2)) {
        for(size in sizes) {
            out <- suppressWarnings(rtn(.mean = rep(0, size),
                                        .low = rep(lows2[case], size),
                                        .high = rep(highs2[case], size)
                                        )
                                    )
            expect_that(length(out), equals(size))
        }
    }
}
          )

test_that("RNG returns draws in bounds", {
    sizes <- c(100000)
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 50)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    for(case in 1:length(lows)) {
        for(size in sizes) {
            out <- rtn(.mean = rep(0, size),
                       .low = rep(lows[case], size),
                       .high = rep(highs[case], size)
                       )
            expect_true(all(out > lows[case]))
            expect_true(all(out < highs[case]))
        }
    }
}
          )

test_that("RNG returns draws correctly [Exp]", {
    sizes <- c(1000000)
    reps <- 1
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    samplemeans <- rep(NA, reps)
    for (rep in 1:reps) {
        for (case in 1:length(lows)) {
            for(size in sizes) {
                samplemeans[rep] <- mean(rtn(.mean = rep(0, size),
                                             .low = rep(lows[case], size),
                                             .high = rep(highs[case], size)
                                             )
                                         )
                popmean <- etn(.low = lows[case], .high = highs[case])
                expect_true(mean(samplemeans - popmean) < .005)
            }
        }
    }
}
          )

test_that("RNG returns draws correctly [Var]", {
    sizes <- c(1000000)
    reps <- 1
    lows <- c(-1, 5, -Inf, 4, 4, -Inf, 7)
    highs <- c(1, Inf, 10, 7, 4.1, Inf, 100)
    samplevars <- rep(NA, reps)
    for (rep in 1:reps) {
        for (case in 1:length(lows)) {
            for(size in sizes) {
                samplevars[rep] <- var(rtn(.mean = rep(0, size),
                                           .low = rep(lows[case], size),
                                           .high = rep(highs[case], size)
                                           )
                                       )
                popvar <- vtn(.low = lows[case], .high = highs[case])
                expect_true(mean(samplevars - popvar) < .005)
            }
        }
    }
}
          )




