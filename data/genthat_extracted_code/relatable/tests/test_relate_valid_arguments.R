library(relatable)
context("relate() returns correct output for valid arguments")

test_that("relate outputs correct vectors for one-to-one relations",	{
  A1 <- c("a", "b", "c")
  B1 <- c(1, 2, 3)
  B2 <- list("apple", c("banana", "berry"), list("cherry", "coconut"))
  # Single mapping
  expect_identical(relate('a', A1, B1),
    1)
  # Vectorised mapping
  expect_identical(relate(c("a", "b"), A1, B1),
    c(1, 2))
  # List output
  expect_identical(relate(c("a", "b"), A1, B1, atomic = FALSE),
    list(1, 2))
  # Named output
  expect_identical(relate(c("a", "b"), A1, B1, named = TRUE),
    c(a = 1, b = 2))
  # Codomain contains lists as elements
  expect_identical(relate(c("a", "b", "c"), A1, B2, atomic = FALSE),
    list("apple", c("banana", "berry"), list("cherry", "coconut")))
  # Domain contains lists as elements
  expect_identical(relate(B2, B2, A1, atomic = TRUE),
    c("a", "b", "c"))
})

test_that("relate outputs correct vectors for non-one-to-one relations",	{
  A1 <- c("a", "b", "c", "d")
  A2 <- c("a", "a", "b", "c")
  A3 <- c("a", "b", "b", "c", "d")
  B1 <- c(1, 2, 3, 4)
  B2 <- c(1, 2, 2, 3)
  B3 <- c(1, 2, 3, 4, 4)
  # MTO by type
  expect_identical(relate(c("a", "b", "c"), A1, B2,
    relation_type = "many_to_one"),
    c(1, 2, 2))
  # MTO by retrictions
  expect_identical(relate(c("a", "b", "c"), A1, B2,
    relation_type = NULL,
    restrictions = list(max_one_y_per_x = TRUE)),
    c(1, 2, 2))
  # OTM by type
  expect_identical(relate(c("a", "b", "c"), A2, B1,
    relation_type = "one_to_many",
    atomic = FALSE),
    list(c(1, 2), 3, 4))
  # OTM by restrictions
  expect_identical(relate(c("a", "b", "c"), A2, B1,
    relation_type = NULL,
    restrictions = list(max_one_x_per_y = TRUE),
    atomic = FALSE),
    list(c(1, 2), 3, 4))
  # MTM by type, named
  expect_identical(relate(c("a", "b", "c", "d"), A3, B3,
    relation_type = "many_to_many",
    named = TRUE,
    atomic = FALSE),
    list(a = 1, b = c(2, 3), c = 4, d = 4))
})

test_that("relate outputs default values as required",	{
  A1 <- c("a", "b", "c", "d")
  B1 <- c(1, 2, 3, 4)
  B2 <- c(1, 2, 3)
  # Input x not in domain
  expect_identical(relate(c("e"), A1, B1,
    relation_type = "one_to_one"),
    NA)
  # Custom value for default
  expect_identical(relate(c("a", "e"), A1, B1,
    relation_type = "one_to_one",
    default = 0),
    c(1, 0))
  # Input x does not have a mapping to codomain
  expect_identical(relate(c("a", "d"), A1, B2,
    relation_type = "one_to_one"),
    c(1, NA))
})

test_that("relate handles heterogeneous outputs", {
  A1 <- c("a", "a", "b", "c", "d", "e", "f", "f")
  B1 <- list(1, "one", c(2, "two"), list(3, "three"), 4, c(5, 6), c("seven", 8))
  # heterogeneous = FALSE (elements coerced to atomic)
  expect_identical(relate(c("a", "b", "c", "d", "e", "f"), A1, B1,
    atomic = FALSE,
    relation_type = NULL),
    list(c("1", "one"), c("2", "two"), c("3", "three"), 4, c(5, 6), c("seven", "8", NA))
  )
  # heterogeneous = TRUE (elements as lists)
  expect_identical(relate(c("a", "b", "c", "d", "e", "f"), A1, B1,
    atomic = FALSE,
    relation_type = NULL,
    heterogeneous_outputs = TRUE),
    list(list(1, "one"), list(c("2", "two")), list(list(3, "three")),
      list(4), list(c(5, 6)), list(c("seven", "8"), NA))
  )
})

test_that("relate performs as expected with NAs and NULLs in the domain and codomain", {
  A1 <- c("a", "b", "c")
  A2 <- c(NA, NaN, "c")
  B1 <- c(1, 2, 3)
  B2 <- c(1, NA, NaN)
  # NAs and NaNs in domain
  expect_identical(relate(A1, A1, B2, default = "D"),
    c(1, NA, NaN))
  # NAs and NaNs in codomain
  expect_identical(relate(A2, A2, B1, default = "D"),
    c(1, 2, 3))
  # NAs and NaNs in domain and codomain
  expect_identical(relate(A2, A2, B2, default = "D"),
    c(1, NA, NaN))
})