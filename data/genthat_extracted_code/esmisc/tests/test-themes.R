context("ggplot themes")

baseplot <- ggplot(mtcars) + 
  geom_point(aes(x = wt, y = mpg, colour = factor(gear))) + 
  facet_wrap(~am)

test_that("esmisc",{
  ggedi <- baseplot +
    theme_edi()
  # test background is white
  expect_true(ggedi$theme$panel.background$fill == 'white')
  expect_true(is.theme(theme_edi()))
})
