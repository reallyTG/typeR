library(phylogram)
context("tree input, manipulation and output")

x1 <- read.dendrogram(text = "(A,(B,C));")
x2 <- read.dendrogram(text = "(A:0.1,B:0.2,(C:0.3,D:0.4)E:0.5)F;")
tmp <- tempfile()
write.dendrogram(x1, file = tmp)
write.dendrogram(x2, file = tmp, append = TRUE)

test_that("read.dendrogram parses Newick string", {
  expect_is(x1, "dendrogram")
  expect_equal(length(x1), 2)
  expect_equal(attr(x1[[1]], "label"), "A")
  expect_true(is.leaf(x1[[1]]))
  expect_is(x2, "dendrogram")
  expect_equal(length(x2), 3)
  expect_equal(attr(x2[[1]], "label"), "A")
  expect_true(is.leaf(x2[[1]]))
  expect_error(read.dendrogram(file = tmp))
})

test_that("prune removes/retains matching nodes", {
  expect_equal(length(prune(x1, "A")), 2)
  expect_equal(length(prune(x2, "A")), 2)
  expect_equal(length(prune(x2, "C")), 3)
  expect_equal(attr(prune(x2, "C"), "members"), 3)
  expect_true(is.leaf(prune(x2, "B", keep = TRUE)))
  expect_equal(length(prune(x2, "F")), 0)
  expect_equal(length(prune(x2, "A|B|C|D")), 0)
})

test_that("tree can be repositioned", {
  expect_equal(attr(x2, "height"), 0.9)
  expect_equal(attr(reposition(x2), "height"), 0.9)
  expect_equal(attr(reposition(x2, shift = 0.1), "height"), 1)
})

test_that("tree can be remidpointed", {
  expect_equal(attr(x2, "midpoint"), 1.25)
  expect_equal(attr(prune(x2, "D"), "midpoint"), 1)
})

test_that("tree can be converted to cladogram", {
  expect_equal(attr(x2[[2]], "height"), 0.7)
  expect_equal(attr(as.cladogram(x2)[[2]], "height"), 0)
})

test_that("tree can be ladderized", {
  expect_equal(attr(ladder(x2, decreasing = FALSE)[[1]], "height"), 0.8)
  expect_equal(attr(ladder(x2, decreasing = TRUE)[[1]], "height"), 0.4)
})

test_that("tree can be converted", {
  expect_true(inherits(as.phylo(x1), "phylo"))
  expect_true(inherits(as.phylo(x2), "phylo"))
  expect_true(inherits(as.dendrogram(as.phylo(x1)), "dendrogram"))
  expect_true(inherits(as.dendrogram(as.phylo(x2)), "dendrogram"))
})

test_that("write.dendrogram outputs Newick string", {
  expect_equal(write.dendrogram(x1, edges = FALSE), "(A,(B,C));")
  expect_equal(write.dendrogram(x2, edges = TRUE),
               "(A:0.1,B:0.2,(C:0.3,D:0.4):0.5);")
})
