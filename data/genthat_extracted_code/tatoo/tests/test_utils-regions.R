context("utils-regions")


test_that("utils-regions works as expected", {
  tdat <- structure(
    c("header.Yxw5flkfj3zxW6ek", "table.qpbgjo3LJKy6mefv", "footer.AM81JEDnw38rJFqa"),
    sheet = c("1", "1", "1"),
    position = c("A1:A3",  "A5:J11", "A13:A13")
  )

  td <- attr(tdat, "position")
  tres <- excel_range_to_indices(td)

  expect_identical(
    vapply(tres, nrow, integer(1)),
    c(3L, 70L, 1L)
  )
})
