context("nltts_plot")

test_that("can get the average of one phylogeny", {

  n_trees <- 2
  n_tips <- 3
  set.seed(41)
  single_phylogeny <- ape::rmtree(N = 1, n = n_tips)
  testthat::expect_silent(nltts_plot(single_phylogeny))
})


test_that("nltts_plot: create some plots", {
  # The inner workings of nltts_plot are done by get_average_nltt_matrix
  newick1 <- "((A:1,B:1):1,(C:1,D:1):1);"
  newick2 <- paste("((((XD:1,ZD:1):1,CE:2):1,(FE:2,EE:2):1):4,",
    "((AE:1,BE:1):1,(WD:1,YD:1):1):5);", sep = "")
  phylogeny1 <- ape::read.tree(text = newick1)
  phylogeny2 <- ape::read.tree(text = newick2)

  expect_silent(
    nLTT::nltts_plot(c(phylogeny1, phylogeny2),
      dt = 0.20, plot_nltts = TRUE)
  )
})

test_that("nltts_plot: check data types", {
  # Create a list or multiPhylo of phylogenies (of type phylo)
  # and run it through the nltts_plot function

  n_trees <- 2
  n_tips <- 3
  set.seed(41)
  ape_phylogenies <- ape::rmtree(N = n_trees, n = n_tips)

  expect_silent(
    nltts_plot(ape_phylogenies)
  )

  set.seed(41)
  treesim_phylogenies <- TreeSim::sim.bd.age(
    6, numbsim = n_trees, lambda = 0.4, mu = 0.0, complete = FALSE)

  expect_silent(
    nltts_plot(treesim_phylogenies)
  )

  set.seed(41)
  combined_phylogenies <- c(ape::rcoal(10), ape::rcoal(20))

  expect_silent(
    nltts_plot(combined_phylogenies)
  )

})



test_that("stop on incorrect input", {

  n_trees <- 2
  n_tips <- 3
  set.seed(41)
  ape_phylogenies <- ape::rmtree(N = n_trees, n = n_tips)

  single_phylogeny <- ape::rmtree(N = 1, n = n_tips)

  # must supply at least something
  expect_error(nltts_plot(c()))

  #  dt must be from 0.0 to and including 1.0
  expect_error(nltts_plot(ape_phylogenies, dt = -0.1))
  expect_error(nltts_plot(ape_phylogenies, dt = 1.1))

  # must supply a phylogeny
  expect_error(nltts_plot(c(1, 2, 3)))

  # must supply only phylogenies
  expect_error(nltts_plot(list(c(1, 2), single_phylogeny)))
})
