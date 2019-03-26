context("Testing downstream analysis functions")
gn1 <- paste0("N_", 1:100)
gn2 <- paste0("N_", seq(2, 200, length=100))
sn1 <- paste0("S_", 1:50)
sn2 <- paste0("S_", 1:75)

coexpSets <- list(
  a=matrix(rnorm(100*100), 100, dimnames=list(gn1, gn1)), 
  b=matrix(rnorm(100*100), 100, dimnames=list(gn2, gn2))
)
adjSets <- coexpSets
exprSets <- list(
  a=matrix(rnorm(50*100), 50, dimnames=list(sn1, gn1)),
  b=matrix(rnorm(75*100), 75, dimnames=list(sn2, gn2))
)
moduleAssignments <- list(a=sample(1:7, 100, replace=TRUE), b=NULL)
names(moduleAssignments[[1]]) <- gn1

# Only analyse modules with > 2 genes
modules <- moduleAssignments[[1]][intersect(names(moduleAssignments[[1]]), 
                                            colnames(adjSets[[2]]))]
modules <- table(modules)
modules <- names(modules[modules > 2])
nModules <- length(modules)

test_that("'networkProperties' function runs without error", {
  expect_is(
    networkProperties(
      adjSets, exprSets, coexpSets, moduleAssignments, modules=modules[1], 
      verbose=FALSE
    ), "list"
  )
  props <- networkProperties(
    adjSets[[1]][1:10, 1:10], exprSets[[1]][,1:10], coexpSets[[1]][1:10, 1:10],
    verbose=FALSE
  )
  expect_is(props, "list")
})

test_that("'nodeOrder' function runs without error", {
  n <- nodeOrder(
    adjSets, exprSets, coexpSets, moduleAssignments, modules=modules[1], 
    verbose=FALSE
  )
  expect_is(n, "character")
  n <- nodeOrder(
    adjSets, NULL, coexpSets, moduleAssignments, modules=modules[1:2], 
    orderModules=FALSE, verbose=FALSE
  )
  expect_is(n, "character")
})

test_that("'sampleOrder' function runs without error", {
  s <- sampleOrder(
    adjSets, exprSets, coexpSets, moduleAssignments, modules=modules[1], 
    verbose=FALSE
  )
  expect_is(s, "character")

  expect_error(
    sampleOrder(
      adjSets, NULL, coexpSets, moduleAssignments, modules=modules[1:2], 
      simplify=FALSE, verbose=FALSE
    )
  )
})
