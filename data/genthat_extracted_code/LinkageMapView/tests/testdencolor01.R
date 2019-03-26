context("Density map color vector")

colvector <-
  rev(colorRampPalette(RColorBrewer::brewer.pal(8, "Spectral"))(25))  # create vector of 25 colors

lgname <- rep("LG1",25)
posvector <- seq(1:25)
df <- data.frame(group=lgname,pos=posvector)

test_that("25 Colors - equal densties", {
  expect_equal(lmvdencolor(df, colorin=colvector)$col, c("#F36F46", "#ED6345",
     "#E85A48", "#E35349", "#DF4D4B", "#DC494C", "#DA454D", "#D7414E",
     "#D53E4F", "#3288BD", "#3288BD", "#3288BD", "#3288BD", "#3288BD",
     "#3288BD", "#D53E4F", "#D7414E", "#DA454D", "#DC494C", "#DF4D4B",
     "#E35349", "#E85A48", "#ED6345", "#F36F46"))
})

