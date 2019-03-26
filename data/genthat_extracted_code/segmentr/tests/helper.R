segments_1to5_6to10_11to15 <- function(N) {
  X1 <- sample(1:2, N, replace = TRUE)
  X2 <- sample(1:2, N, replace = TRUE)
  X3 <- sample(1:2, N, replace = TRUE)
  X4 <- sample(1:2, N, replace = TRUE)
  X5 <- sample(1:2, N, replace = TRUE)
  X6 <- sample(1:2, N, replace = TRUE)
  X <- cbind(X1, X1 - X2, X2, X1 + X2, X1, X3, X3 - X4, X4, X3 + X4, X3, X5, X5 - X6, X6, X5 + X6, X5)
  X
}

segments_1to10_11to15 <- function(N) {
  X1 <- sample(1:3, N, replace = TRUE)
  X2 <- sample(1:3, N, replace = TRUE)
  X5 <- sample(1:3, N, replace = TRUE)
  X6 <- sample(1:3, N, replace = TRUE)
  X <- cbind(X1, X1 - X2, X2, X1 + X2, X1, X1, X1 - X2, X2, X1 + X2, X1, X5, X5 - X6, X6, X5 + X6, X5)
  X
}

makeRandom <- function(rows, columns) {
  matrix(rbinom(rows * columns, size = 2, p = 0.5), nrow = rows, ncol = columns)
}

foreach <- foreach::foreach
`%do%` <- foreach::`%do%`

consistent_segments <- function(segments) {
  last_segment <- tail(segments, 1)[[1]]
  last <- tail(last_segment, 1)
  agg <- foreach(segment = segments, .combine = c) %do% segment

  all(agg == 1:last)
}

make_segment <- function(n, rows = 100, p = 0.9) matrix(rbinom(rows * n, 1, p), nrow = rows)

make_segmented <- function(segments, rows = 100, p = 0.9) {
  if (!consistent_segments(segments)) stop("Segments are not consistent")

  columns <- sum(sapply(segments, length))
  probs <- rep(c(p, 1 - p), times = length(segments) / 2 + 1)

  foreach(indices = segments, p = probs, .combine = cbind) %do% {
    make_segment(n = length(indices), rows = rows, p = p)
  }
}

mean_likelihood <- function(X) {
  mean_value <- mean(X, na.rm = T)
  if (is.na(mean_value)) {
    0
  } else {
    -sum((X - mean_value)^2)
  }
}

capture_print <- function(...) capture.output(print(...))

with_algorithms <- function(test_cases) {
  for (algorithm in c("exact", "hierarchical", "hybrid")) {
    test_cases(algorithm)
  }
}
