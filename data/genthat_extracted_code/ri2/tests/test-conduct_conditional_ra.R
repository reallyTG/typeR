context("Conditional RA")


test_that("Conditional RA", {
  N <- 100


  declaration <-
    randomizr::declare_ra(
      N = N,
      num_arms = 3,
      simple = TRUE
    )

  # Simple ------------------------------------------------------------------


  Z <- randomizr::conduct_ra(declaration)

  Z2 <- conduct_conditional_ra(
    declaration = declaration,
    assignment_vec = Z,
    conditions = c("T1", "T2")
  )

  table(Z, Z2, useNA = "always")



  declaration <- randomizr::declare_ra(N = N, num_arms = 3)

  # Complete ----------------------------------------------------------------


  Z <- randomizr::conduct_ra(declaration)

  Z2 <- conduct_conditional_ra(
    declaration = declaration,
    assignment_vec = Z,
    conditions = c("T1", "T2")
  )

  table(Z)
  table(Z2)
  table(Z, Z2)


  # blocked -----------------------------------------------------------------
  blocks <- rep(c("A", "B", "C"), times = c(50, 100, 200))

  declaration <-
    declare_ra(blocks = blocks, prob_each = c(.1, .8, .1))
  Z <- conduct_ra(declaration)
  table(blocks, Z)


  Z2 <- conduct_conditional_ra(
    declaration = declaration,
    assignment_vec = Z,
    conditions = c("T1", "T2")
  )

  table(Z, blocks)
  table(Z2, blocks)
  table(Z, Z2)


  # Clustered ---------------------------------------------------------------
  clusters <- rep(letters, times = 1:26)
  declaration <- declare_ra(clusters = clusters, num_arms = 3)
  Z <- conduct_ra(declaration)
  table(Z, clusters)

  Z2 <- conduct_conditional_ra(
    declaration = declaration,
    assignment_vec = Z,
    conditions = c("T1", "T2")
  )

  table(Z, clusters)
  table(Z2, clusters)
  table(Z, Z2)

  # Blocked and Clustered ---------------------------------------------------

  clusters <- rep(letters, times = 1:26)

  blocks <- rep(NA, length(clusters))
  blocks[clusters %in% letters[1:5]] <- "block_1"
  blocks[clusters %in% letters[6:10]] <- "block_2"
  blocks[clusters %in% letters[11:15]] <- "block_3"
  blocks[clusters %in% letters[16:20]] <- "block_4"
  blocks[clusters %in% letters[21:26]] <- "block_5"

  declaration <-
    declare_ra(
      clusters = clusters,
      blocks = blocks,
      num_arms = 3
    )
  Z <- conduct_ra(declaration)

  Z2 <- conduct_conditional_ra(
    declaration = declaration,
    assignment_vec = Z,
    conditions = c("T1", "T2")
  )

  table(Z, clusters)
  table(Z2, clusters)
  table(Z, Z2)

  expect_true(TRUE)
})



test_that("Conditional without conditions!", {
  N <- 100

  declaration <- declare_ra(N)

  Z <- randomizr::conduct_ra(declaration)

  Z2 <- conduct_conditional_ra(
    declaration = declaration,
    assignment_vec = Z,
    conditions = c(0, 1)
  )

  expect_true(all(table(Z) == N/2))

  table(Z2)
  table(Z, Z2)
})
