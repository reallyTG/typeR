context("print.labelled")

test_that(
  "print labelled vector",
  {
    a <- set_label(1:10, "integers")
    expect_output(
      print(a),
      "^integers\n \\["
    )
  }
)

# This was observed on the first attempt to release to CRAN
# If labels were set in sequence, the class attribute became
# "labelled" "labelled" "labelled", "integer"
# This test ensures we get the correct printing
test_that(
  "print labelled vector",
  {
    a <- set_label(1:10, "integers")
    a <- set_label(1:10, "integers")
    a <- set_label(1:10, "integers")
    expect_output(
      print(a),
      "^integers\n \\["
    )
  }
)

# This test ensure we don't replicate the class

test_that(
  "don't replicate 'labelled' class",
  {
    a <- set_label(1:10, "integers")
    a <- set_label(1:10, "integers")
    a <- set_label(1:10, "integers")
    expect_equal(
      class(a),
      c("labelled", "integer")
    )
  }
)


