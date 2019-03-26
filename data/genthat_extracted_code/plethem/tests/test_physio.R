context("physiological params")
library(plethem)

test_that("Body weight is correct",{
  expect_gte(getLifecourseBodyWeightFemale(25),66)
  expect_gte(getLifecourseBodyWeightMale(25),81)
  expect_lte(getLifecourseBodyWeightFemale(25),67)
  expect_lte(getLifecourseBodyWeightMale(25),82)
})

test_that("Cardiac output is correct",{
  expect_gte(getLifecourseCardiacOutputFemaleSciV(25,0),368)
  expect_gte(getLifecourseCardiacOutputMaleSciV(25,0),421)
  expect_lte(getLifecourseCardiacOutputFemaleSciV(25,0),369)
  expect_lte(getLifecourseCardiacOutputMaleSciV(25,0),422)
})

test_that("Tissue volumes are less than 85% of body weight",{
  tissue_vols <- getLifecourseTissueVolumes(tissues = c("blood","fat","skin","muscle",
                                                        "bone","brain",
                                                        "lung","heart","gi","kidney",
                                                        "liver","rpf","spf"))
  expect_lte(sum(tissue_vols),68)
})
