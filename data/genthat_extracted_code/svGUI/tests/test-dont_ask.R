context("dont_ask")

test_that("dont_ask returns current GUI state", {
  expect_identical(dont_ask(), !interactive() || !gui_ask(gui))
  expect_error(
    if (interactive()) dont_ask(gui = "noGUI") else
      stop("'gui' object 'noGUI' not found"),
    "'gui' object 'noGUI' not found",
    fixed = TRUE
  )
})
