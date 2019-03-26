library(relatable)
context("relation() reports properties of given mapping correctly for report_properties = TRUE")

test_that("report_properties can correctly determine properties of a given relation",	{
  A1 <- c("a", "b", "c")
  A2 <- c("a", "a", "c", "d")
  A3 <- c("a", "a", "c", "d", "e")
  A4 <- c("a", "b", "c", "d")
  B1 <- c(1, 2, 3)
  B1.1 <- list("apple", c("banana", "berry"), list("cherry", "coconut"))
  B2 <- c(1, 2, 2, 3, 4)
  B3 <- c(1, 2, 2, 3)
  B4 <- c(1, 2, 3, 4)
  # Bijection (T T T T) with atomic domain and codomain
  expect_message(relation(A1, B1, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: TRUE\nmax_one_x_per_y: TRUE")
  # Bijection with atomic domain and list codomain
  expect_message(relation(A1, B1.1, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: TRUE\nmax_one_x_per_y: TRUE")
  # Bijection with list domain and atomic codomain
  expect_message(relation(B1.1, A1, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: TRUE\nmax_one_x_per_y: TRUE")
  # T F F F
  expect_message(relation(A2, B2, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: FALSE\nmax_one_y_per_x: FALSE\nmax_one_x_per_y: FALSE")
  # F T F F
  expect_message(relation(A3, B3, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: FALSE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: FALSE\nmax_one_x_per_y: FALSE")
  # T T F F
  expect_message(relation(A3, B2, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: FALSE\nmax_one_x_per_y: FALSE")
  # T F T F
  expect_message(relation(A4, B2, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: FALSE\nmax_one_y_per_x: TRUE\nmax_one_x_per_y: FALSE")
  # F T F T
  expect_message(relation(A3, B4, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: FALSE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: FALSE\nmax_one_x_per_y: TRUE")
  # T T F T
  expect_message(relation(A2, B4, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: FALSE\nmax_one_x_per_y: TRUE")
  # T T T F
  expect_message(relation(B4, A2, atomic = FALSE, relation_type = NULL, report_properties = TRUE), "Relation properties:\nmin_one_y_per_x: TRUE\nmin_one_x_per_y: TRUE\nmax_one_y_per_x: TRUE\nmax_one_x_per_y: FALSE")
})