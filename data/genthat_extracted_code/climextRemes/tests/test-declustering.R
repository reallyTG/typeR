require(testthat)

context("Testing remove_runs().")

index <- c(1,2,4,5,6,10,12,13,14,15,18,19,20)
y <- seq_along(index)
result <- y
result[c(1,3,4,7,8,9,11,12)] <- NA
test_that(paste0("test remove_runs() with max last, ordered"), {
    expect_identical(remove_runs(y, index),
                result)
})

result <- y
result[c(2,4,5,8,9,10,12,13)] <- NA
test_that(paste0("test remove_runs() with min first, ordered"), {
    expect_identical(remove_runs(y, index, FALSE),
                result)
})

index <- c(1,2,4,5,6,10,12,13,14,15,18,19,20)
y <- -seq_along(index)
result <- y
result[c(2,4,5,8,9,10,12,13)] <- NA
test_that(paste0("test remove_runs() with max first, ordered"), {
    expect_identical(remove_runs(y, index),
                result)
})

index <- -rev(c(1,2,4,5,6,10,12,13,14,15,18,19,20))
y <- seq_along(index)
result <- y
result[c(1,2,4,5,6,9,10,12)] <- NA
test_that(paste0("test remove_runs(), negative indices, ordered"), {
    expect_identical(remove_runs(y, index),
                result)
})

index <- c(1,4,5,6,2,12,13,14,15,18,20,19,10)
y <- seq_along(index)
result <- y
result[c(1,2,3,6:8,10:11)] <- NA
test_that(paste0("test remove_runs(), unordered"), {
    expect_identical(remove_runs(y, index),
                result)
})

index <- 20
y <- seq_along(index)
result <- y
test_that(paste0("test remove_runs(), single value"), {
    expect_identical(remove_runs(y, index),
                y)
})

index <- c(14,20)
y <- seq_along(index)
result <- y
test_that(paste0("test remove_runs(), no removals"), {
    expect_identical(remove_runs(y, index),
                y)
})

context("Testing screen_within_block().")

index <- c(1,10,11,15,19,21,45,51,53)
y <- seq_along(index)
result <- y
result[c(1,3,4,8)] <- NA
test_that(paste0("test screen_within_block() with max last, ordered"), {
    expect_identical(screen_within_block(y, index),
                result)
})

index <- c(1,10,11,15,19,21,45,51,53)
y <- -seq_along(index)
result <- y
result[c(2,4,5,9)] <- NA
test_that(paste0("test screen_within_block() with max first, ordered"), {
    expect_identical(screen_within_block(y, index),
                result)
})

index <- c(1,10,11,15,19,21,45,51,53)
y <- c(0, 1, 5, 3, 7, 9, 11, 0, 7)
result <- y
result[c(1,3,4,8)] <- NA
test_that(paste0("test screen_within_block() with max last, unordered"), {
    expect_identical(screen_within_block(y, index),
                result)
})


index <- 20
y <- seq_along(index)
test_that(paste0("test screen_within_block(), single value"), {
    expect_equal(screen_within_block(y, index),
                y)
})

index <- c(5,20)
y <- seq_along(index)
test_that(paste0("test screen_within_block(), no removals"), {
    expect_equal(screen_within_block(y, index),
                y)
})
