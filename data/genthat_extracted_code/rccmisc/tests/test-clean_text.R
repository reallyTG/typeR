
context("clean_text")

test_that("misc", {
  expect_that(clean_text("hej"), is_equivalent_to("hej"))  
  expect_that(clean_text("Hej pa dig!"), is_equivalent_to("hejpadig"))  
})