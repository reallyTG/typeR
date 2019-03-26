context("gppm-plotlong")
test_that("simple", {
  thePlot <- plot(demoLGCM)
  expect_identical(class(thePlot),c('gg','ggplot'))
})

test_that("select all arguments", {
  thePlot <- plot(demoLGCM,c(1,2,3),'t','ID','y')
  expect_identical(class(thePlot),c('gg','ggplot'))
})
