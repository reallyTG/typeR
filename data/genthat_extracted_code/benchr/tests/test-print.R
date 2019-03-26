context("Print method")

b <- benchmark(1 + 1, One = 0 + 1)

test_that("'print_details' output contains correct fields", {
    expect_output(print_details(b), "Timer precision : ")
    expect_output(print_details(b), "Timer error : ")
    expect_output(print_details(b), "Replications : 100")
    expect_output(print_details(b), "Expressions order : ")
    expect_output(print_details(b), "Garbage collection : ")
})

test_that("'print.summaryBecnhmark' output contains correct fields", {
    expect_output(print(summary(b)), "Time units : ")
    expect_output(print(summary(b)), "1 + 1")
    expect_output(print(summary(b)), "One")
    expect_output(print(summary(b)), "min")
    expect_output(print(summary(b)), "lw.qu")
    expect_output(print(summary(b)), "mean")
    expect_output(print(summary(b)), "median")
    expect_output(print(summary(b)), "up.qu")
    expect_output(print(summary(b)), "max")
    expect_output(print(summary(b)), "total")
})

test_that("'print.meanBenchmark' output contains correct fields", {
    expect_output(print(mean(b)), "Time units : ")
    expect_output(print(mean(b)), "1 + 1")
    expect_output(print(mean(b)), "One")
    expect_output(print(mean(b)), "mean")
    expect_output(print(mean(b)), "trimmed")
    expect_output(print(mean(b)), "lw.ci")
    expect_output(print(mean(b)), "up.ci")
})

test_that("Print methods returns the input object", {
    expect_identical(b, print(b))
    expect_identical(summary(b), print(summary(b)))
    expect_identical(mean(b), print(mean(b)))
})

test_that("'order' param throws erorr with a wrong column name", {
    expect_error(print(b, order = "z"))
    expect_error(print(summary(b), order = "z"))
    expect_error(print(mean(b), order = "z"))
})

test_that("'details' works correct", {
    expect_output(print(b, details = TRUE), "Timer error")
})
