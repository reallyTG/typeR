library(relatable)
context("relation() returns correct output for valid arguments")

test_that("relation outputs correct vectors for one-to-one relations",	{
  A1 <- c("a", "b", "c")
  B1 <- c(1, 2, 3)
  B2 <- list("apple", c("banana", "berry"), list("cherry", "coconut"))
  # Single mapping
  expect_identical(relation(A1, B1)('a'),
    1)
  # Vectorised mapping
  expect_identical(relation(A1, B1)(c("a", "b")),
    c(1, 2))
  # List output
  expect_identical(relation(A1, B1, atomic = FALSE)(c("a", "b")),
    list(1, 2))
  # Named output
  expect_identical(relation(A1, B1, named = TRUE)(c("a", "b")),
    c(a = 1, b = 2))
  # Codmain contains lists
  expect_identical(relation(A1, B2, atomic = FALSE)(c("a", "b", "c")),
    list("apple", c("banana", "berry"), list("cherry", "coconut")))
  # Domain contains lists
  expect_identical(relation(B2, A1, atomic = TRUE)(B2),
    c("a", "b", "c"))
})

test_that("relation outputs correct vectors for non-one-to-one relations",	{
  A1 <- c("a", "b", "c", "d")
  A2 <- c("a", "a", "b", "c")
  A3 <- c("a", "b", "b", "c", "d")
  B1 <- c(1, 2, 3, 4)
  B2 <- c(1, 2, 2, 3)
  B3 <- c(1, 2, 3, 4, 4)
  # MTO by type
  expect_identical(relation(A1, B2,
    relation_type = "many_to_one")(c("a", "b", "c")),
    c(1, 2, 2))
  # MTO by restrictions
  expect_identical(relation(A1, B2,
    relation_type = NULL,
    restrictions = list(max_one_y_per_x = TRUE))(c("a", "b", "c")),
    c(1, 2, 2))
  # OTM by type
  expect_identical(relation(A2, B1,
    relation_type = "one_to_many",
    atomic = FALSE)(c("a", "b", "c")),
    list(c(1, 2), 3, 4))
  # OTM by restrictions
  expect_identical(relation(A2, B1,
    relation_type = NULL,
    restrictions = list(max_one_x_per_y = TRUE),
    atomic = FALSE)(c("a", "b", "c")),
    list(c(1, 2), 3, 4))
  # MTM by type, named
  expect_identical(relation(A3, B3,
    relation_type = "many_to_many",
    named = TRUE,
    atomic = FALSE)(c("a", "b", "c", "d")),
    list(a = 1, b = c(2, 3), c = 4, d = 4))
})

test_that("relation outputs default values as required",	{
  A1 <- c("a", "b", "c", "d")
  B1 <- c(1, 2, 3, 4)
  B2 <- c(1, 2, 3)
  # Input x not in domain
  expect_identical(relation(A1, B1,
    relation_type = "one_to_one")(c("e")),
    NA)
  # Custom value for default
  expect_identical(relation(A1, B1,
    default = 0,
    relation_type = "one_to_one")(c("a", "e")),
    c(1, 0))
  # Input x does not have a mapping to codomain
  expect_identical(relation(A1, B2,
    relation_type = "one_to_one")(c("a", "d")),
    c(1, NA))
})

test_that("relation handles heterogeneous outputs", {
  A1 <- c("a", "a", "b", "c", "d", "e", "f", "f")
  B1 <- list(1, "one", c(2, "two"), list(3, "three"), 4, c(5, 6), c("seven", 8))
  # heterogeneous = FALSE (elements coerced to atomic)
  expect_identical(relation(A1, B1,
    atomic = FALSE,
    relation_type = NULL)(c("a", "b", "c", "d", "e", "f")),
    list(c("1", "one"), c("2", "two"), c("3", "three"), 4, c(5, 6), c("seven", "8", NA))
  )
  # heterogeneous = TRUE (elements as lists)
  expect_identical(relation(A1, B1,
    atomic = FALSE,
    relation_type = NULL,
    heterogeneous_outputs = TRUE)(c("a", "b", "c", "d", "e", "f")),
    list(list(1, "one"), list(c("2", "two")), list(list(3, "three")),
      list(4), list(c(5, 6)), list(c("seven", "8"), NA))
  )
})

test_that("relation checks for and ignores duplicate mappings from A to B when handle_duplicate_mappings = TRUE", {
  A1 <- c("a", "a", "b")
  B1 <- c(1, 1, 2)
  # heterogeneous = FALSE (elements coerced to atomic)
  expect_identical(relation(A1, B1,
    atomic = TRUE,
    handle_duplicate_mappings = TRUE,
    relation_type = "bijection")(c("a", "b")),
    c(1, 2)
  )
})