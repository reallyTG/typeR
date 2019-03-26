context("Test the plot returns an expected object")

test_that("the layers are in the expected order", {
  p_no_repel <- gghalfnorm(rnorm(10))
  expect_identical(class(p_no_repel$layers[[1]]$geom)[1], "GeomPoint")
  expect_identical(class(p_no_repel$layers[[2]]$geom)[1], "GeomText")
  expect_identical(class(p_no_repel$layers[[3]]$geom)[1], "GeomAbline")

  p_repel <- gghalfnorm(rnorm(10), repel = TRUE)
  expect_identical(class(p_repel$layers[[1]]$geom)[1], "GeomPoint")
  expect_identical(class(p_repel$layers[[2]]$geom)[1], "GeomPoint")
  expect_identical(class(p_repel$layers[[3]]$geom)[1], "GeomTextRepel")
  expect_identical(class(p_repel$layers[[4]]$geom)[1], "GeomAbline")
})

test_that(
  paste0("only labels are returned when the number of labels equals ",
         "the length of the data"),
  {
    p_no_repel <- gghalfnorm(rnorm(10), nlab = 10)
    expect_identical(class(p_no_repel$layers[[1]]$geom)[1], "GeomText")
    expect_identical(class(p_no_repel$layers[[2]]$geom)[1], "GeomAbline")

    p_repel <- gghalfnorm(rnorm(10), nlab = 10, repel = TRUE)
    expect_identical(class(p_repel$layers[[1]]$geom)[1], "GeomPoint")
    expect_identical(class(p_repel$layers[[2]]$geom)[1], "GeomTextRepel")
    expect_identical(class(p_repel$layers[[3]]$geom)[1], "GeomAbline")
  })

test_that("a slope isn't added when there is only one point", {
  p <- gghalfnorm(rnorm(1))
  expect_identical(class(p$layers[[1]]$geom)[1], "GeomText")
})
