context("build_gho")

test_that("normal inputs work", {
  no_attr <- rgho:::build_gho(
    x = LETTERS[1:5],
    labels = letters[1:5]
  )

  expect_identical(
    no_attr,
    structure(
      c("A", "B", "C", "D", "E"),
      labels = c("a", "b", "c", "d", "e"),
      class = "gho"
    )
  )

  a <- tibble::tibble(
    x = rev(letters[1:5]),
    y = rev(letters[1:5])
  )
  with_attr <- rgho:::build_gho(
    x = LETTERS[1:5],
    labels = letters[1:5],
    attrs = a
  )

  expect_identical(
    with_attr,
    structure(
      c("A", "B", "C", "D", "E"),
      labels = c("a", "b", "c", "d", "e"),
      attrs = structure(list(
        x = c("e", "d", "c", "b", "a"),
        y = c("e", "d", "c", "b", "a")),
        .Names = c("x", "y"),
        class = c("tbl_df", "tbl", "data.frame"),
        row.names = c(NA, -5L)), class = "gho")
  )

  expect_identical(
    no_attr,
    rgho:::build_gho(
      x = setNames(LETTERS[1:5], LETTERS[1:5]),
      labels = setNames(letters[1:5], letters[1:5])
    )
  )
})

test_that("wrong input fails", {
  expect_error(
    rgho:::build_gho(
      x = matrix(1:4, nrow = 2),
      labels = LETTERS[1:4]
    )
  )
  expect_error(
    rgho:::build_gho(
      x = LETTERS[1:4],
      labels = matrix(1:4, nrow = 2)
    )
  )
  expect_error(
    rgho:::build_gho(
      x = LETTERS[1:4],
      labels = letters[1:5]
    )
  )
  expect_error(
    rgho:::build_gho(
      x = 1:5,
      labels = letters[1:5]
    )
  )
  expect_error(
    rgho:::build_gho(
      x = LETTERS[1:5],
      labels =
        1:5
    )
  )
  expect_error(
    rgho:::build_gho(
      x = LETTERS[1:5],
      labels = letters[1:5],
      attrs = 1:5
    )
  )
  b <- tibble::tibble(
    x = 1:4
  )
  expect_error(
    rgho:::build_gho(
      x = LETTERS[1:5],
      labels = letters[1:5],
      attrs = b
    )
  )
  expect_error(
    rgho:::get_gho(url = "http://google.com/doesntexist", retry = 0)
  )
})
