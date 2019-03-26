
# test_that code for rich series of functions

# library(testthat)
# library(wiqid)
# test_file("test-rich.R")
# test_file(file.choose())

if(FALSE) {
context("Rarifaction")

test_that("richRarify gives the right answers",  {
  data(KillarneyBirds)
  kil <- KillarneyBirds[, -10]
  kilCntVec <- rowSums(kil)
  res <- richChao1(kilCntVec)
  expect_that(names(res), equals(c("Chao1", "Chao1Low", "Chao1Upp", "Chao1SD")))
 
} )
}

context("Abundance-based richness")
# =================================

test_that("richChao1 matches EstimateS",  {
  data(KillarneyBirds)
  kilCntVec <- rowSums(KillarneyBirds)
  res <- richChao1(kilCntVec)
  expect_that(names(res), equals(c("Chao1", "Chao1Low", "Chao1Upp", "Chao1SD")))
  expect_that(round(res, 2), 
      is_equivalent_to(c(33, 31.28, 45.36, 2.65))) # EstS output
  res <- richChao1(KillarneyBirds)
  expect_that(names(res), equals(c("Chao1", "Chao1Low", "Chao1Upp", "Chao1SD")))
  expect_that(round(res, 2), 
      is_equivalent_to(c(33, 31.28, 45.36, 2.65))) # EstS output

  # Bias-corrected version
  res <- richChao1(kilCntVec, correct=TRUE)
  expect_that(names(res), equals(c("Chao1", "Chao1Low", "Chao1Upp", "Chao1SD")))
  expect_that(round(res, 2), 
      is_equivalent_to(c(32.2, 31.14, 41.37, 1.84)))
        # EstS output is 32.2, 31.13, 41.36, 1.84, but is rounded down.
  res <- richChao1(kilCntVec, ci=0.85)
  expect_that(round(res, 2), 
      is_equivalent_to(c(33, 31.47, 39.51, 2.65)))

  # no singletons:
  res <- richChao1(kilCntVec+1)
  expect_that(round(res, 2), 
      is_equivalent_to(c(31, 31, 31, 0)))
        # EstS output is 31, 30.99, 31, 0, but is rounded down.
  # no singletons or doubletons:
  res <- richChao1(kilCntVec+2)
  expect_that(round(res, 2), 
      is_equivalent_to(c(31, 31, 31, 0)))
        # EstS output is 31, 30.99, 31, 0, but is rounded down.
  #TODO check for no doubletons when singletons present.
})


test_that("richACE matches EstimateS",  {
  data(KillarneyBirds)
  kilCntVec <- rowSums(KillarneyBirds)
  res <- richACE(kilCntVec)
  expect_that(length(res), equals(1))
  expect_that(round(res, 2), 
      is_equivalent_to(33.03)) # EstS output is 33.02
  res <- richACE(KillarneyBirds)
  expect_that(round(res, 2), 
      is_equivalent_to(33.03)) # EstS output is 33.02
  # no singletons:
  res <- richACE(kilCntVec+1)
  expect_that(round(res, 2), 
      is_equivalent_to(31)) # EstS output
  # no singletons or doubletons:
  res <- richACE(kilCntVec+2)
  expect_that(round(res, 2), 
      is_equivalent_to(31)) # EstS output
} )

test_that("richJackA1 gives same answers",  {
  data(Temburong)
  expect_that(richJackA1(Temburong), equals(386))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, richJackA1)
  expect_that(length(res), equals(9))
  expect_that(res, 
      is_equivalent_to(c(24, 29, 21, 18, 9, 16, 21, 24, 22)))
  # Check with matrix input:
  expect_that(richJackA1(KillarneyBirds), equals(35))
} )

test_that("richJackA2 gives same answers",  {
  data(Temburong)
  expect_that(richJackA2(Temburong), equals(433))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, richJackA2)
  expect_that(length(res), equals(9))
  expect_that(res, 
      is_equivalent_to(c(25, 34, 24, 19, 10, 17, 22, 23, 23)))
  # Check with matrix input:
  expect_that(richJackA2(KillarneyBirds), equals(35))
} )

test_that("richRenLau gives same answers",  {
  data(Temburong)
  expect_that(richRenLau(Temburong), equals(351))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, richRenLau)
  expect_that(length(res), equals(9))
  expect_that(res, 
      is_equivalent_to(c(22, 26, 18, 17, 9, 15, 19, 24, 20)))
  # Check with matrix input:
  expect_that(richRenLau(KillarneyBirds), equals(34))
} )

test_that("richSingle gives same answers",  {
  data(Temburong)
  expect_that(richSingle(Temburong), equals(110))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, richSingle)
  expect_that(length(res), equals(9))
  expect_that(res, 
      is_equivalent_to(c(4, 7, 6, 3, 1, 2, 4, 3, 4)))
  # Check with matrix input:
  expect_that(richSingle(KillarneyBirds), equals(4))
} )

test_that("richDouble gives same answers",  {
  data(Temburong)
  expect_that(richDouble(Temburong), equals(63))
  data(KillarneyBirds)
  res <- apply(KillarneyBirds, 2, richDouble)
  expect_that(length(res), equals(9))
  expect_that(res, 
      is_equivalent_to(c(3, 2, 3, 2, 0, 1, 3, 4, 3)))
  # Check with matrix input:
  expect_that(richDouble(KillarneyBirds), equals(4))
} )


context("Incidence-based richness")
# =================================

test_that("richChao2 matches EstimateS",  {
  # Killarny bird data
  data(KillarneyBirds)
  kilInc <- (KillarneyBirds > 0) * 1
  res <- richChao2(kilInc)
  expect_that(names(res), equals(c("Chao2", "Chao2Low", "Chao2Upp", "Chao2SD")))
  expect_that(round(res, 2), 
      is_equivalent_to(c(34.6, 31.65, 50.94, 3.85))) # EstS output
  res <- richChao2(KillarneyBirds)
  expect_that(round(res, 2), 
      is_equivalent_to(c(34.6, 31.65, 50.94, 3.85))) # EstS output

  # Bias-corrected version
  res <- richChao2(kilInc, correct=TRUE)
  expect_that(round(res, 2), 
      is_equivalent_to(c(33.22, 31.36, 44.88, 2.63)))
        # EstS output is 33.22, 31.35, 44.88, 2.62, but is rounded down.

  res <- richChao2(kilInc, ci=0.85)
  expect_that(round(res, 2), 
      is_equivalent_to(c(34.6, 32.02, 43.66, 3.85)))

  #TODO check for no uniques, no duplicates.
} )

test_that("richICE matches EstimateS",  {
  data(KillarneyBirds)
  kilInc <- (KillarneyBirds > 0) * 1
  res <- richICE(kilInc)
  expect_that(length(res), equals(1))
  expect_that(round(res, 2), 
      is_equivalent_to(34.86)) # EstS output
  res <- richICE(KillarneyBirds)
  expect_that(round(res, 2), 
      is_equivalent_to(34.86)) # EstS output

} )

test_that("richJack1 matches EstimateS",  {
  data(seedbank)
  expect_that(round(richJack1(seedbank), 2), equals(36.98)) # EstS gives 36.97
  data(KillarneyBirds)
  expect_that(round(richJack1(KillarneyBirds), 2), equals(36.33)) # EstS output
} )

test_that("richJack2 matches EstimateS",  {
  data(seedbank)
  expect_that(round(richJack2(seedbank), 2), equals(37.98)) # EstS gives 37.97
  data(KillarneyBirds)
  expect_that(round(richJack2(KillarneyBirds), 2), equals(37.60)) # EstS gives 36.59
} )

test_that("richBoot matches EstimateS",  {
  data(seedbank)
  expect_that(round(richBoot(seedbank), 2), equals(35.58)) # EstS gives 35.57
  data(KillarneyBirds)
  expect_that(round(richBoot(KillarneyBirds), 2), equals(33.66)) # EstS gives 33.65
} )

test_that("richMM matches EstimateS",  {
  data(seedbank)
  expect_that(round(richMM(seedbank), 2), equals(36.33)) # EstS output
  data(KillarneyBirds)
  expect_that(round(richMM(KillarneyBirds), 2), equals(33.81)) # EstS output
} )

test_that("richSobs gives same answers",  {
  data(Temburong)
  expect_that(richSobs(Temburong), equals(276)) 
  data(KillarneyBirds)
  expect_that(richSobs(KillarneyBirds), equals(31)) 
  expect_that(apply(KillarneyBirds, 2, richSobs), 
      is_equivalent_to(c(20, 22, 15, 15, 8, 14, 17, 21, 18 )))
  data(seedbank)
  expect_that(richSobs(seedbank), equals(34))
} )

test_that("richUnique gives same answers",  {
  data(seedbank)
  expect_that(richUnique(seedbank), equals(3))
  data(KillarneyBirds)
  expect_that(richUnique(KillarneyBirds), equals(6))
  expect_that(richUnique(KillarneyBirds[,1]), 
    throws_error())
} )

test_that("richDuplicate gives same answers",  {
  data(seedbank)
  expect_that(richDuplicate(seedbank), equals(2))
  data(KillarneyBirds)
  expect_that(richDuplicate(KillarneyBirds), equals(5))
  expect_that(richDuplicate(KillarneyBirds[,1]), 
    throws_error())
} )



