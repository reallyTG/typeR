context("test-againstDotC")

test_that("int", {
    cc <- .C("TEST_times2_int",  a = 2L, r = integer(1),
             PACKAGE = "dotCall64")
    dc <- .C64("TEST_times2_int", c("int", "int"),  a = 2L, r = integer(1),
               INTENT = c("rw", "rw"),
               PACKAGE = "dotCall64")
    expect_equal(cc, dc, label = "[values]")
    expect_equal(lapply(cc, typeof), lapply(dc, typeof),
                 label = "[types]")             
    })


test_that("double", {
    cc <- .C("TEST_times2_double",  a = 2.2, r = double(1),
             PACKAGE = "dotCall64")
    dc <- .C64("TEST_times2_double", c("double", "double"),
               a = 2.2, r = double(1),
               INTENT = c("rw", "rw"),
               PACKAGE = "dotCall64")
    expect_equal(cc, dc, label = "[values]")
    expect_equal(lapply(cc, typeof), lapply(dc, typeof),
                 label = "[types]")   
    })

## --------------------
test_that("referenced-integer", {
    input <- 2L
    cc <- .C("TEST_times2_int",  a = input, r = input,
             PACKAGE = "dotCall64")
    dc <- .C64("TEST_times2_int", c("int", "int"),
               a = input, r = input,
               INTENT = c("rw", "rw"),
               PACKAGE = "dotCall64")
    expect_equal(cc, dc, label = "[values]")
    expect_equal(lapply(cc, typeof), lapply(dc, typeof),
                 label = "[types]")   
    expect_identical(input, 2L)
})

test_that("referenced-double", {
    input <- 2.2
    cc <- .C("TEST_times2_double",  a = input, r = input,
             PACKAGE = "dotCall64")
    dc <- .C64("TEST_times2_double", c("double", "double"),
               a = input, r = input,
               INTENT = c("rw", "rw"),
               PACKAGE = "dotCall64")
    expect_equal(cc, dc, label = "[values]")
    expect_equal(lapply(cc, typeof), lapply(dc, typeof),
                 label = "[types]")   
    expect_identical(input, 2.2)
})
