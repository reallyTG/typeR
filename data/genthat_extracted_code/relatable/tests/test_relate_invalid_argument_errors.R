library(relatable)
context("relate() returns correct errors for invalid arguments")

test_that("fatal errors reported correctly",	{
  A1 <- c("a", "b", "c")
  B1 <- c(1, 2, 3)
  # Invalid map_error_response given
  expect_error(relate(A1, A1, B1,
    map_error_response = "albatross"),
    '"albatross" is not a valid input for map_error_response. Use "ignore", "warn", or "throw".')
  # atomic = TRUE when min_one_y_per_x = FALSE
  expect_error(relate(A1, A1, B1,
    atomic = TRUE, relation_type = NULL),
    "Many-to-many and one-to-many relations can only return list vectors. Use atomic = FALSE.")
  # heterogeneous_outputs = TRUE when min_one_y_per_x = FALSE
  expect_error(relate(A1, A1, B1,
    heterogeneous_outputs = TRUE,
    relation_type = NULL),
    "Many-to-many and one-to-many relations can only return list vectors. Use atomic = FALSE.")
})

test_that("map_error_response options behave correctly",	{
  A1 <- c("a", "b", "c")
  B1 <- c(1, 2, 2)
  B2 <- c(1, 2, 3)
  # Ignore
  expect_identical(relate(A1, A1, B1,
    relation_type = "bijection",
    map_error_response = "ignore"),
    c(1, 2, 2))
  expect_identical(relate("d", A1, B2,
    allow_default = FALSE,
    relation_type = "bijection",
    map_error_response = "ignore"),
    NA)
  # Warn
  expect_warning(relate(A1, A1, B1,
    relation_type = "bijection",
    map_error_response = "warn"),
    "Vector B contains duplicate elements which may map from different elements in the domain.")
  expect_warning(relate("d", A1, B2,
    allow_default = FALSE,
    relation_type = "bijection",
    map_error_response = "warn"),
    "d does not have a valid mapping to an element in the codomain.")
  expect_identical(suppressWarnings(relate("d", A1, B2,
    allow_default = FALSE,
    relation_type = "bijection",
    map_error_response = "warn")),
    NA)
  # Throw
  expect_error(relate(A1, A1, B1,
    relation_type = "bijection",
    map_error_response = "throw"),
    "Vector B contains duplicate elements which may map from different elements in the domain.")
  expect_error(relate("d", A1, B1,
    allow_default = FALSE,
    relation_type = "bijection",
    map_error_response = "throw"),
    "Vector B contains duplicate elements which may map from different elements in the domain.")
})

test_that("report conflicts between mappings and restrictions with handle_duplicate_mappings = FALSE", {
  A1 <- c("a", "a", "c", "d", "e")
  A2 <- c("a", "b", "c", "d")
  B1 <- c(1, 2, 2, 3, 4)
  B2 <- c(1, 2, 3, 4)
  # min_one_y_per_x conflict
  expect_warning(relate("a", A1, B2,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = FALSE,
    restrictions = list(min_one_y_per_x = TRUE)),
    "Vector A is larger than B There may exist elements in the domain that do not map to an element in the codomain.")
  # min_one_x_per_y conflict
  expect_warning(relate("a", A2, B1,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = FALSE,
    restrictions = list(min_one_x_per_y = TRUE)),
    "Vector B is larger than A There may exist elements in the codomain that do not map from an element in the domain.")
  # max_one_y_per_x conflict with "warn"
  expect_warning(relate("a", A1, B2,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = FALSE,
    restrictions = list(max_one_y_per_x = TRUE)),
    "Vector A contains duplicate elements which may map to different elements in the codomain. Only mapping from the first occurrence of each of these elements will be returned.")
  # max_one_y_per_x conflict with "throw"
  expect_error(relate("a", A1, B2,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = FALSE,
    restrictions = list(max_one_y_per_x = TRUE),
    map_error_response = "throw"),
    "Vector A contains duplicate elements which may map to different elements in the codomain.")
  # max_one_x_per_y conflict
  expect_warning(relate("a", A2, B1,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = FALSE,
    restrictions = list(max_one_x_per_y = TRUE)),
    "Vector B contains duplicate elements which may map from different elements in the domain.")
})

test_that("report conflicts between mappings and restrictions with handle_duplicate_mappings = TRUE", {
  A1 <- c("a", "a", "c", "d", "e")
  A2 <- c("a", "b", "c", "d")
  B1 <- c(1, 2, 2, 3, 4)
  B2 <- c(1, 2, 3, 4)
  # min_one_y_per_x conflict
  expect_warning(relate(c("a", "c"), A1, B2,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = TRUE,
    restrictions = list(min_one_y_per_x = TRUE)),
    "Restrictions violated:\nmin_one_y_per_x")
  # min_one_x_per_y conflict
  expect_warning(relate(c("a", "c"), A2, B1,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = TRUE,
    restrictions = list(min_one_x_per_y = TRUE)),
    "Restrictions violated:\nmin_one_x_per_y")
  # max_one_y_per_x conflict
  expect_warning(relate(c("a", "c"), A1, B2,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = TRUE,
    restrictions = list(max_one_y_per_x = TRUE)),
    "Restrictions violated:\nmax_one_y_per_x")
  # max_one_x_per_y conflict
  expect_warning(relate(c("a", "c"), A2, B1,
    atomic = FALSE,
    relation_type = NULL,
    handle_duplicate_mappings = TRUE,
    restrictions = list(max_one_x_per_y = TRUE)),
    "Restrictions violated:\nmax_one_x_per_y")
})