context("Parse log")

test_that("Correct input", {
    expect_error(parse_log(1))
    expect_error(parse_log(""))
    expect_error(parse_log(c("Rprof.out", "Rprof-source.out")))
})

test_that("Output classes", {
    proflog <- parse_log("Rprof.out")
    expect_is(proflog, "data.frame")
    expect_is(proflog$pathString, "character")
    expect_is(proflog$real, "numeric")
    expect_is(proflog$percent, "numeric")
})

test_that("Remove source frame", {
    proflog <- parse_log("Rprof-source.out")
    expect_false(any(grepl("source", proflog$pathString)))
})

test_that("Remove line number", {
    proflog <- parse_log("Rprof-line.out")
    expect_false(any(grepl("\\d+#\\d+", proflog$pathString)))
})

test_that("Remove GC", {
    proflog <- parse_log("Rprof-gc.out")
    expect_false(any(grepl("<GC>", proflog$pathString)))
})
