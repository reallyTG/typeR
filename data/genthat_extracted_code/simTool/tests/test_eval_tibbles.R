testthat::context("test_eval_tibbles.R")

genData1 <- function(df) {
  df[[1]][, 1]
}

genData2 <- function(df) {
  df[[1]][, 2]
}

dg <- expand_tibble(
  fun = c("genData1", "genData2"),
  df = list(
    matrix(1:6, 3, 2),
    matrix(1:8, 4, 2)
  )
)


f <- function(data, .truth) {
  .truth$df[[1]]
}

pg <- expand_tibble(proc = "f")
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = FALSE)

test_that("Explicit defined .truth parameter of the data analyzing function can access the matrix for the data generating function", {
  expect_true(all(sapply(1:8, function(i) all(eg$simulation$df[[i]] == eg$simulation$results[[i]]))))
})

###############################################################

dg <- expand_tibble(
  fun = c("genData1", "genData2"),
  df = list(
    matrix(1:6, 3, 2),
    matrix(1:8, 4, 2)
  ),
  xyz = NA
)


f <- function(data, .truth) {
  .truth$df[[1]]
}

pg <- expand_tibble(proc = "f")
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = FALSE)

test_that("Explicit defined .truth parameter of the data analyzing function can access the matrix for the data generating function", {
  expect_true(all(sapply(1:8, function(i) all(eg$simulation$df[[i]] == eg$simulation$results[[i]]))))
})


################################################################

f <- function(data, .truth) {
  0
}

post_ana <- function(result, .truth) {
  .truth$df[[1]]
}


pg <- expand_tibble(proc = "f")
eg <- eval_tibbles(dg, pg,
  rep = 2, envir = environment(), simplify = FALSE,
  post_analyze = post_ana
)


test_that("Explicit defined .truth parameter of the post analyzing function can access the matrix for the data generating function", {
  expect_true(all(sapply(1:8, function(i) all(eg$simulation$df[[i]] == eg$simulation$results[[i]]))))
})


##############################################################

dg <- expand_tibble(
  fun = c("genData1", "genData2"),
  df = list(
    matrix(1:6, 3, 2),
    matrix(1:8, 4, 2)
  )
)
dg$.truth <- 1:4


f <- function(data, .truth) {
  .truth
}

pg <- expand_tibble(proc = "f")
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = TRUE)

test_that("Explicit defined .truth column is passed to the data analyzing function", {
  expect_identical(eg$simulation$results, c(1L, 1L, 2L, 2L, 3L, 3L, 4L, 4L))
})

##############################################################

f <- function(data, .truth) {
  0
}

post_ana <- function(result, .truth) {
  .truth
}

pg <- expand_tibble(proc = c("f"))
eg <- eval_tibbles(dg, pg,
  rep = 2, envir = environment(), simplify = TRUE,
  post_analyze = post_ana
)

test_that("Explicit defined .truth column is passed to the post analyzing function", {
  expect_identical(eg$simulation$results, c(1L, 1L, 2L, 2L, 3L, 3L, 4L, 4L))
})

##############################################################

f <- function(data, .truth) {
  0
}

pg <- expand_tibble(proc = c("f", "min"))
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = TRUE)

test_that("Mixture of data analyzing function with and without .truth parameter work", {
  expect_identical(eg$simulation$results, c(0, 1, 0, 1, 0, 4, 0, 4, 0, 1, 0, 1, 0, 5, 0, 5))
})


###########################################################

pg <- expand_tibble(proc = c("f"), .truth = 1)

test_that("Warning if proc_grid has a .truth-column", {
  expect_warning(eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = TRUE), "\\.truth.*ignored")
})




##############################################################

f <- function(data, .truth) {
  0
}

dg$a <- 4:7
names(dg)[4] <- ".truth"

pg <- expand_tibble(proc = c("f"))

test_that("Error if data grid has two columns .truth", {
  expect_error(eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = TRUE), "only one column with name '.truth' allowed")
})

#############################################################


rng <- function(data, ...) {
  ret <- range(data)
  names(ret) <- c("min", "max")
  ret
}

dg <- expand_tibble(
  fun = c("genData1", "genData2"),
  df = list(
    matrix(1:6, 3, 2),
    matrix(1:8, 4, 2)
  )
)



pg <- expand_tibble(proc = "rng")
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = FALSE)

expected_df <- structure(list(
  fun = c("genData1", "genData1", "genData2", "genData2", "genData1", "genData1", "genData2", "genData2"),
  df = list(
    structure(1:6, .Dim = c(3L, 2L)),
    structure(1:6, .Dim = c(3L, 2L)), structure(1:6, .Dim = c(3L, 2L)),
    structure(1:6, .Dim = c(3L, 2L)), structure(1:8, .Dim = c(4L, 2L)),
    structure(1:8, .Dim = c(4L, 2L)), structure(1:8, .Dim = c(4L, 2L)),
    structure(1:8, .Dim = c(4L, 2L))
  ),
  replications = c(1L, 2L, 1L, 2L, 1L, 2L, 1L, 2L), proc = c("rng", "rng", "rng", "rng", "rng", "rng", "rng", "rng"),
  results = list(
    structure(c(1L, 3L), .Names = c("min", "max")),
    structure(c(1L, 3L), .Names = c("min", "max")),
    structure(c(4L, 6L), .Names = c("min", "max")),
    structure(c(4L, 6L), .Names = c("min", "max")),
    structure(c(1L, 4L), .Names = c("min", "max")),
    structure(c(1L, 4L), .Names = c("min", "max")),
    structure(c(5L, 8L), .Names = c("min", "max")),
    structure(c(5L, 8L), .Names = c("min", "max"))
  )
),
.Names = c("fun", "df", "replications", "proc", "results"),
row.names = c(NA, -8L),
class = c("tbl_df", "tbl", "data.frame")
)


test_that("Tibbles for data generating functions can be used. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})

test_that("Generated data is stored.", {
  expect_identical(eg$generated_data, list(1:3, 1:3, 4:6, 4:6, 1:4, 1:4, 5:8, 5:8))
})

eg <- eval_tibbles(dg, pg, discard_generated_data = TRUE, envir = environment())

test_that("No entry for generated_data.", {
  expect_false(all(grepl("generated_data", names(eg))))
})

cl <- parallel::makeCluster(rep("localhost", 2), type = "PSOCK")
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = FALSE, cluster = cl)
test_that("Generated data is stored if a cluster is used.", {
  expect_identical(eg$generated_data, list(1:3, 1:3, 4:6, 4:6, 1:4, 1:4, 5:8, 5:8))
})

eg <- eval_tibbles(dg, pg,
  rep = 2, envir = environment(), simplify = FALSE, cluster = cl,
  discard_generated_data = TRUE
)

test_that("No entry for generated_data if a cluster is used.", {
  expect_false(all(grepl("generated_data", names(eg))))
})

parallel::stopCluster(cl)


#################################################################



genMat <- function(df) {
  df[[1]][, 1]
}

mat_mult <- function(A, B) {
  A %*% B[[1]]
}

dg <- expand_tibble(
  fun = c("genMat"),
  df = list(
    matrix(1:4, 2, 2),
    matrix(5:8, 2, 2)
  )
)

pg <- expand_tibble(
  proc = "mat_mult",
  B = list(matrix(1:4, 2, 2), matrix(5:8, 2, 2))
)

eg <- eval_tibbles(dg, pg, rep = 1, envir = environment(), simplify = FALSE)

expected_df <- structure(
  list(
    fun = c("genMat", "genMat", "genMat", "genMat"),
    df = list(
      structure(1:4, .Dim = c(2L, 2L)), structure(1:4, .Dim = c(2L, 2L)),
      structure(5:8, .Dim = c(2L, 2L)), structure(5:8, .Dim = c(2L, 2L))
    ),
    replications = c(1L, 1L, 1L, 1L), proc = c("mat_mult", "mat_mult", "mat_mult", "mat_mult"),
    B = list(
      structure(1:4, .Dim = c(2L, 2L)),
      structure(5:8, .Dim = c(2L, 2L)), structure(1:4, .Dim = c(2L, 2L)),
      structure(5:8, .Dim = c(2L, 2L))
    ),
    results = list(
      structure(c(5, 11), .Dim = 1:2), structure(c(17, 23), .Dim = 1:2),
      structure(c(17, 39), .Dim = 1:2), structure(c(61, 83), .Dim = 1:2)
    )
  ),
  .Names = c("fun", "df", "replications", "proc", "B", "results"),
  row.names = c(NA, -4L),
  class = c("tbl_df", "tbl", "data.frame")
)


test_that("Tibbles for data generating and data analyzing functions can be used. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})

##################################################################

dg <- expand_tibble(fun = "seq_len", length.out = 1:3)
pg <- expand_tibble(proc = "rng")
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = FALSE)


expected_df <- structure(list(
  fun = c(
    "seq_len", "seq_len", "seq_len", "seq_len",
    "seq_len", "seq_len"
  ), length.out = c(1L, 1L, 2L, 2L, 3L, 3L),
  replications = c(1L, 2L, 1L, 2L, 1L, 2L), proc = c(
    "rng",
    "rng", "rng", "rng", "rng", "rng"
  ), results = list(
    structure(c(
      1L,
      1L
    ), .Names = c("min", "max")), structure(c(1L, 1L), .Names = c(
      "min",
      "max"
    )), structure(1:2, .Names = c("min", "max")), structure(1:2, .Names = c(
      "min",
      "max"
    )), structure(c(1L, 3L), .Names = c("min", "max")),
    structure(c(1L, 3L), .Names = c("min", "max"))
  )
), .Names = c(
  "fun",
  "length.out", "replications", "proc", "results"
), row.names = c(
  NA,
  -6L
), class = c("tbl_df", "tbl", "data.frame"))


test_that(
  "Data grid that was used is preserved in the object returned by evalGrids",
  expect_true(all(eg$data_grid == dg))
)

test_that(
  "Proc grid that was used is preserved in the object returned by evalGrids",
  expect_true(all(eg$proc_grid == pg))
)

test_that("One analyzing function. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})
##################################################################

eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = TRUE)
expected_df <- structure(list(fun = c(
  "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len"
), length.out = c(
  1L, 1L, 1L, 1L, 2L, 2L,
  2L, 2L, 3L, 3L, 3L, 3L
), replications = c(
  1L, 1L, 2L, 2L, 1L,
  1L, 2L, 2L, 1L, 1L, 2L, 2L
), proc = c(
  "rng", "rng", "rng", "rng",
  "rng", "rng", "rng", "rng", "rng", "rng", "rng", "rng"
), results = c(
  1L,
  1L, 1L, 1L, 1L, 2L, 1L, 2L, 1L, 3L, 1L, 3L
)), row.names = c(
  NA,
  -12L
), class = c("tbl_df", "tbl", "data.frame"), .Names = c(
  "fun",
  "length.out", "replications", "proc", "results"
))

test_that("Simplify the simulation results", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})


##################################################################

eg <- eval_tibbles(dg, pg,
  envir = environment(), simplify = TRUE,
  post_analyze = purrr::compose(tibble::as_tibble, t, identity)
)
# due to a bug introduced with purrr 0.3.0 (https://github.com/tidyverse/purrr/issues/629)
# identity in purrr::compose is a necessary workaround




expected_df <- structure(list(
  fun = c("seq_len", "seq_len", "seq_len"), length.out = 1:3,
  replications = c(1L, 1L, 1L), proc = c("rng", "rng", "rng"), min = c(1L, 1L, 1L), max = 1:3
), row.names = c(NA, -3L), class = c("tbl_df", "tbl", "data.frame"), .Names = c(
  "fun",
  "length.out", "replications", "proc", "min", "max"
))

test_that("Post analyze function works", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})

##################################################################

dg <- expand_tibble(fun = "seq_len", length.out = 1:3)
pg <- expand_tibble(proc = c("rng", "median", "length"))
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), simplify = FALSE)

expected_df <- structure(list(fun = c(
  "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len"
), length.out = c(
  1L, 1L, 1L, 1L, 1L, 1L,
  2L, 2L, 2L, 2L, 2L, 2L, 3L, 3L, 3L, 3L, 3L, 3L
), replications = c(
  1L,
  1L, 1L, 2L, 2L, 2L, 1L, 1L, 1L, 2L, 2L, 2L, 1L, 1L, 1L, 2L, 2L,
  2L
), proc = c(
  "rng", "median", "length", "rng", "median", "length",
  "rng", "median", "length", "rng", "median", "length", "rng",
  "median", "length", "rng", "median", "length"
), results = list(
  structure(c(1L, 1L), .Names = c("min", "max")), 1L, 1L, structure(c(
    1L,
    1L
  ), .Names = c("min", "max")), 1L, 1L, structure(1:2, .Names = c(
    "min",
    "max"
  )), 1.5, 2L, structure(1:2, .Names = c("min", "max")),
  1.5, 2L, structure(c(1L, 3L), .Names = c("min", "max")),
  2L, 3L, structure(c(1L, 3L), .Names = c("min", "max")), 2L,
  3L
)), .Names = c(
  "fun", "length.out", "replications", "proc",
  "results"
), row.names = c(NA, -18L), class = c(
  "tbl_df", "tbl",
  "data.frame"
))

test_that("Three analyzing functions. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})

##################################################################

test_that("Error if summary function is not a list", {
  expect_error(eval_tibbles(dg, pg, rep = 2, envir = environment(), summary_fun = c(mean), simplify = FALSE), "must be NULL or a named list")
})

test_that("Error if summary function is not a named list", {
  expect_error(eval_tibbles(dg, pg, rep = 2, envir = environment(), summary_fun = list(mean), simplify = FALSE), "must be NULL or a named list")
})


##################################################################

eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), summary_fun = list(mean = mean), simplify = FALSE)

expected_df <- structure(list(fun = c(
  "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len"
), length.out = c(
  1L,
  1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L
), replications = c(
  1L, 1L, 1L,
  1L, 1L, 1L, 1L, 1L, 1L
), summary_fun = c(
  "mean", "mean", "mean",
  "mean", "mean", "mean", "mean", "mean", "mean"
), proc = c(
  "rng",
  "median", "length", "rng", "median", "length", "rng", "median",
  "length"
), results = list(structure(list(min = 1, max = 1), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 1), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 1
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 2), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 1.5), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 2
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 3), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 2), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 3
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)))), .Names = c(
  "fun", "length.out", "replications",
  "summary_fun", "proc", "results"
), row.names = c(NA, -9L), class = c(
  "tbl_df",
  "tbl", "data.frame"
))

test_that("Three analyzing functions and one summary function. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})


##################################################################

eg <- eval_tibbles(dg, pg, rep = 4, envir = environment(), summary_fun = list(mean = mean, sum = sum, prod = prod), simplify = FALSE)

expected_df <- structure(list(fun = c(
  "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len"
), length.out = c(
  1L,
  1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 2L, 2L, 2L, 2L, 2L, 2L, 2L, 2L,
  2L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L, 3L
), replications = c(
  1L,
  1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L,
  1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L
), summary_fun = c(
  "mean",
  "mean", "mean", "prod", "prod", "prod", "sum", "sum", "sum",
  "mean", "mean", "mean", "prod", "prod", "prod", "sum", "sum",
  "sum", "mean", "mean", "mean", "prod", "prod", "prod", "sum",
  "sum", "sum"
), proc = c(
  "rng", "median", "length", "rng", "median",
  "length", "rng", "median", "length", "rng", "median", "length",
  "rng", "median", "length", "rng", "median", "length", "rng",
  "median", "length", "rng", "median", "length", "rng", "median",
  "length"
), results = list(structure(list(min = 1, max = 1), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 1), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 1
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 1), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 1), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 1
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 4L, max = 4L), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 4L), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 4L
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 2), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 1.5), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 2
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 16), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 5.0625), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 16
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 4L, max = 8L), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 6), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 8L
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 3), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 2), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 3
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 81), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 16), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 81
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 4L, max = 12L), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 8L), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 12L
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)))), .Names = c(
  "fun", "length.out", "replications",
  "summary_fun", "proc", "results"
), row.names = c(NA, -27L), class = c(
  "tbl_df",
  "tbl", "data.frame"
))



test_that("Three analyzing functions and three summary function. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})



##################################################################

eg <- eval_tibbles(dg, pg, rep = 20, envir = environment(), summary_fun = list(mean = mean), ncpus = 2, simplify = FALSE)

expected_df <- structure(list(fun = c(
  "seq_len", "seq_len", "seq_len", "seq_len",
  "seq_len", "seq_len", "seq_len", "seq_len", "seq_len"
), length.out = c(
  1L,
  1L, 1L, 2L, 2L, 2L, 3L, 3L, 3L
), replications = c(
  1L, 1L, 1L,
  1L, 1L, 1L, 1L, 1L, 1L
), summary_fun = c(
  "mean", "mean", "mean",
  "mean", "mean", "mean", "mean", "mean", "mean"
), proc = c(
  "rng",
  "median", "length", "rng", "median", "length", "rng", "median",
  "length"
), results = list(structure(list(min = 1, max = 1), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 1), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 1
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 2), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 1.5), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 2
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)), structure(list(min = 1, max = 3), .Names = c(
  "min",
  "max"
), row.names = c(NA, -1L), class = c("tbl_df", "tbl", "data.frame")), structure(list(value = 2), .Names = "value", row.names = c(
  NA,
  -1L
), class = c("tbl_df", "tbl", "data.frame")), structure(list(
  value = 3
), .Names = "value", row.names = c(NA, -1L), class = c(
  "tbl_df",
  "tbl", "data.frame"
)))), .Names = c(
  "fun", "length.out", "replications",
  "summary_fun", "proc", "results"
), row.names = c(NA, -9L), class = c(
  "tbl_df",
  "tbl", "data.frame"
))
test_that("Three analyzing functions and one summary function over 2 cpus. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})

##################################################################

shift <- -1
gen_data <- function() {
  shift <<- shift + 1
  tibble::tibble(group = letters[1:3], b = 1:3 + shift)
}

dg <- expand_tibble(fun = c("gen_data"))
pg <- expand_tibble(proc = "identity")
eg <- eval_tibbles(dg, pg,
  rep = 3, envir = environment(), summary_fun = list(mean = mean, sum = sum),
  group_for_summary = "group", simplify = FALSE
)

expected_df <- structure(
  list(
    fun = c("gen_data", "gen_data"), replications = c(1L, 1L), summary_fun = c("mean", "sum"),
    proc = c("identity", "identity"),
    results = structure(
      list(
        mean = structure(list(group = c("a", "b", "c"), b = c(2, 3, 4)),
          class = c("tbl_df", "tbl", "data.frame"),
          .Names = c("group", "b"), row.names = c(NA, -3L)
        ),
        sum = structure(list(group = c("a", "b", "c"), b = c(6, 9, 12)),
          class = c("tbl_df", "tbl", "data.frame"), .Names = c("group", "b"),
          row.names = c(NA, -3L)
        )
      ),
      .Names = c("mean", "sum")
    )
  ),
  .Names = c("fun", "replications", "summary_fun", "proc", "results"),
  row.names = c(NA, -2L),
  class = c("tbl_df", "tbl", "data.frame")
)

test_that("One group for summary_fun. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_identical(eg$simulation[[col]], expected_df[[col]])  
  }
})

##################################################################

shift <- -1
gen_data <- function() {
  shift <<- shift + 1
  tibble::tibble(group1 = letters[1:3], group2 = letters[4:6], b = 1:3 + shift)
}

dg <- expand_tibble(fun = c("gen_data"))
pg <- expand_tibble(proc = "identity")
eg <- eval_tibbles(dg, pg,
  rep = 3, envir = environment(), summary_fun = list(mean = mean, sum = sum),
  group_for_summary = c("group1", "group2"), simplify = FALSE
)

expected_df <-
  tibble::tibble(
    fun = "gen_data",
    replications = 1L,
    summary_fun = c("mean", "sum"),
    proc = "identity",
    results = list(
      mean = dplyr::group_by(tibble::tibble(group1 = letters[1:3], group2 = letters[4:6], b = c(2.0, 3.0, 4.0)), group1, group2),
      sum = dplyr::group_by(tibble::tibble(group1 = letters[1:3], group2 = letters[4:6], b = c(6.0, 9.0, 12.0)), group1, group2)
    )
  )

test_that("Two groups for summary_fun. Results were created and stored in simulation", {
  for (col in colnames(eg$simulation)) {
    expect_equal(eg$simulation[[col]], expected_df[[col]])  
  }
})


##################################################################

ret_global_var <- function(dummy) {
  paste(get("globalVar", envir = globalenv()), "executed on cluster", sep = ", ")
}
dg <- expand_tibble(fun = "seq_len", length.out = 1:3)
pg <- expand_tibble(proc = "ret_global_var")
assign("globalVar", "uploaded to cluster", envir = .GlobalEnv)
eg <- eval_tibbles(dg, pg, rep = 10, envir = environment(), ncpus = 2, cluster_global_objects = c("globalVar"), simplify = FALSE)

test_that("Variable gets uploaded to the cluster.", {
  expect_identical(unique(unlist(eg$simulation$results)), "uploaded to cluster, executed on cluster")
})

test_that("Error is variable is not uploaded to cluster", {
  err <- try(eval_tibbles(dg, pg, rep = 10, envir = environment(), ncpus = 2, simplify = FALSE), silent = TRUE)
  expect_equal(class(err), "try-error")
  expect_true(grepl("'globalVar' not found", err))
})

##################################################################

pg <- expand_tibble(proc = c("mean"))
fetch_other_pkgs <- function(dummy) {
  names(sessionInfo()$otherPkgs)
}

cl <- parallel::makeCluster(rep("localhost", 2), type = "PSOCK")
dg <- expand_tibble(fun = "seq_len", length.out = 1:3)
pg <- expand_tibble(proc = "fetch_other_pkgs")
eg <- eval_tibbles(dg, pg, rep = 2, envir = environment(), cluster = cl, simplify = FALSE)

test_that("No libraries loaded on the cluster.", {
  expect_true(is.null(unique(unlist(eg$simulation$results))))
})

eg <- eval_tibbles(dg, pg,
  rep = 2, envir = environment(),
  cluster = cl,
  cluster_libraries = c("boot"), simplify = FALSE
)

test_that("Library boot loaded on the cluster.", {
  expect_equal(unique(unlist(eg$simulation$results)), "boot")
})

test_that("Warning if cluster and ncpus are specified and that the cluster cl is not stopped", {
  expect_warning(
    eval_tibbles(dg, pg,
      rep = 2, envir = environment(),
      ncpus = 2,
      cluster = cl,
      cluster_libraries = c("boot"), simplify = FALSE
    ),
    "Ignore argument ncpus"
  )
  # just repeat the call. If the cluster would have been stopped an error would occur
  expect_warning(
    eval_tibbles(dg, pg,
      rep = 2, envir = environment(),
      ncpus = 2,
      cluster = cl,
      cluster_libraries = c("boot"), simplify = FALSE
    ),
    "Ignore argument ncpus"
  )
})


parallel::stopCluster(cl)
