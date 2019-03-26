testthat::context("Render")

testthat::test_that("", {
  layout <- Layout()
  screen <- Screen(10, 6)
  render <- Render(layout, screen)

  modules::extend(render, {
    slide <- Slide("EMPTY")
    renderInformation <- prepare(slide)
    testthat::expect_true(length(renderInformation) == 6)
    testthat::expect_true(all(nchar(renderInformation) == 11))
  })

  modules::extend(render, {
    slide <- Slide(c("a", "b", "c", "d"))
    renderInformation <- prepare(slide)
    testthat::expect_true(length(renderInformation) == 6)
    testthat::expect_true(all(nchar(renderInformation) == 11))
  })

})
