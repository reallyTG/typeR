context("Testing calculate_distance")

check_output <- function(x, y, o, e) {
  expect_equal(nrow(o), nrow(x))
  expect_equal(rownames(o), rownames(x))

  if (is.null(y)) y <- x
  expect_equal(ncol(o), nrow(y))
  expect_equal(colnames(o), rownames(y))

  if (!is.null(e)) {
    expect_true(all(abs(as.vector(o) - e) < 1e-10))
  }
}

dist_tib <- tribble(
  ~method, ~dist_fun,
  "euclidean", euclidean_distance,
  "manhattan", manhattan_distance,
  "spearman", function(x, y) correlation_distance(x, y, method = "spearman"),
  "pearson", function(x, y) correlation_distance(x, y, method = "pearson"),
  "kendall", function(x, y) correlation_distance(x, y, method = "kendall")
)


test_that("calculate_distance and other functions return the correct format", {
  x <- matrix(c(1, 2, 5, 3), ncol = 2)
  y <- matrix(c(5, 6, 7, 8, 9, 10), ncol = 2)

  purrr::walk(dist_tib$method, function(method) {
    o <- calculate_distance(x, y, method = method)
    check_output(x, y, o, e = NULL)
  })

  rownames(x) <- c("A", "B")
  rownames(y) <- c("C", "D", "E")
  colnames(x) <- colnames(y) <- c("f1", "f2")

  purrr::walk(dist_tib$method, function(method) {
    o <- calculate_distance(x, y, method = method)
    check_output(x, y, o, e = NULL)
  })
})

test_that("calculate_distance work when y is NULL", {
  x <- matrix(c(1, 2, 5, 3), ncol = 2)
  y <- NULL

  purrr::walk(dist_tib$method, function(method) {
    o <- calculate_distance(x, y, method = method)
    check_output(x, y, o, e = NULL)
  })

  rownames(x) <- c("A", "B")
  colnames(x) <- c("f1", "f2")

  purrr::walk(dist_tib$method, function(method) {
    o <- calculate_distance(x, y, method = method)
    check_output(x, y, o, e = NULL)
  })
})

test_that("calculate_distance returns the same output as the metric-specific functions", {
  x <- matrix(c(1, 2, 5, 3), ncol = 2)
  y <- matrix(c(5, 6, 7, 8, 9, 10), ncol = 2)
  rownames(x) <- c("A", "B")
  rownames(y) <- c("C", "D", "E")
  colnames(x) <- colnames(y) <- c("f1", "f2")

  purrr::walk(seq_len(nrow(dist_tib)), function(i) {
    method <- dist_tib$method[[i]]
    dist_fun <- dist_tib$dist_fun[[i]]
    o1 <- calculate_distance(x, y, method = method)
    o2 <- dist_fun(x, y)
    check_output(x, y, o2, e = as.vector(o1))
  })
})


test_that("calculate_distance returns collect solutions", {
  x <- matrix(c(1, 7, 2, 3), nrow = 1)
  y <- matrix(c(1.5, 4.5, 2.5, 6.5), nrow = 1)

  expected <- unlist(list(
    euclidean = sqrt(sum((x - y)^2)),
    manhattan = sum(abs(x - y)),
    spearman = 1 - (cor(t(x), t(y), method = "spearman") + 1) / 2,
    pearson = 1 - (cor(t(x), t(y), method = "pearson") + 1) / 2,
    kendall = 1 - (cor(t(x), t(y), method = "kendall") + 1) / 2
  ))

  sapply(dist_tib$method, function(method) {
    o <- calculate_distance(x, y, method = method)
    check_output(x, y, o, e = expected[[method]])
  })
})
