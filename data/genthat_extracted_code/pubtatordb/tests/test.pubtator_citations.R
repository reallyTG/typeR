context("pubtator_citations")

test_that(
  "invalid inputs produce an error",
  {
    # When there is an argument.
    expect_error({
      pubtator_citations(10)
    })
  }
)

test_that(
  "valid inputs produce valid output",
  {
    # When there is no argument.
    expect_message(pubtator_citations())
  }
)



