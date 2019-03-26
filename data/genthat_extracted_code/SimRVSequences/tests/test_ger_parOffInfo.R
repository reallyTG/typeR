library(testthat)
context("get_parOffInfo")

data("study_peds")

test_that("Returns correct dads", {
  red_ped <- study_peds[study_peds$FamID == sample(1:5, size = 1), ]
  poinf <- get_parOffInfo(red_ped)

  expect_equal(red_ped$dadID[which(red_ped$ID %in% poinf$offspring_ID)],
               poinf$parent_ID[poinf$parent == "dadID"])
})


test_that("Returns correct moms", {
  red_ped <- study_peds[study_peds$FamID == sample(1:5, size = 1), ]
  poinf <- get_parOffInfo(red_ped)

  expect_equal(red_ped$momID[which(red_ped$ID %in% poinf$offspring_ID)],
               poinf$parent_ID[poinf$parent == "momID"])
})


test_that("Returns correct offspring RV status", {
  red_ped <- study_peds[study_peds$FamID == sample(1:5, size = 1), ]
  #plot(red_ped)
  poinf <- get_parOffInfo(red_ped)

  #get offspring IDs to test
  offIDs <- poinf$offspring_ID[poinf$parent == "dadID"]
  #Offspring RVstatus returned by function
  offRVstat <- poinf$Off_RVstatus[poinf$parent == "dadID"]

  expect_equal(as.numeric(rowSums(red_ped[which(red_ped$ID %in% offIDs), c("DA1", "DA2")])),
               offRVstat)
})


