context("Correlation")

describe("correlation", {
  corr <- correlation(1:10, 1:10)

  it("produces a Correlation, matrix object", {
    expect_is(corr, "matrix")
    expect_is(corr, "Correlation")
  })
  it("produces a 2x2 matrix for 2 variables", {
    expect_equal(nrow(corr), 2)
    expect_equal(ncol(corr), 2)
  })
  it("produces a 1/1/1/1 matrix for twice the same variable", {
    expect_equivalent(as.numeric(corr), rep(1, 4))
  })
  rm(corr)

  it("raises an error if non-numeric arguments for x or y", {
    expect_error(correlation("text", 1:10), "'x' must be numeric", fixed = TRUE)
    expect_error(correlation(1:10, "text"), "'y' must be numeric", fixed = TRUE)
  })
})
