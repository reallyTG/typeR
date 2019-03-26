context("Testing 'modulePreservation' function")
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

test_that("Main routine runs and produces sane output", {
  res1 <- modulePreservation(
    adjSets, exprSets, coexpSets, moduleAssignments, modules,
    discovery=1, test=2, nPerm=1000, verbose=FALSE, nThreads=2
  )
  expect_equal(dim(res1$nulls), c(nModules , 7, 1000))
  expect_equal(dim(res1$observed), c(nModules , 7))
  expect_equal(dim(res1$p.values), c(nModules , 7))
  expect_equal(length(res1$propVarsPresent), nModules)
  expect_equal(length(res1$nVarsPresent), nModules)
  res2 <- modulePreservation(
    adjSets, NULL, coexpSets, moduleAssignments,
    modules, discovery=1, test=2, nPerm=1000, 
    verbose=FALSE, nThreads=2
  )
  expect_equal(dim(res2$nulls), c(nModules, 4, 1000))
  expect_equal(dim(res2$observed), c(nModules, 4))
  expect_equal(dim(res2$p.values), c(nModules, 4))
  expect_equal(length(res2$propVarsPresent), nModules)
  expect_equal(length(res2$nVarsPresent), nModules)
  
  res1 <- modulePreservation(
    adjSets, exprSets, coexpSets, moduleAssignments, 
    modules, discovery="a", test="b", nPerm=4,
    verbose=FALSE, nThreads=2
  )
})
rm(exprSets, coexpSets, adjSets)
gc()
