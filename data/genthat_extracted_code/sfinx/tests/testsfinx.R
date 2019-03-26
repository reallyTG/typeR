library(sfinx)
context("General sfinx performance and sfinx input/output handling")

test_that("sfinx returns the correct PrintOutput on the example data", {
  expect_equal(sfinx(DataInputExampleFile, BaitIdentityExampleFile)[[2]], "All baits were found as possible preys. Some baits yielded interactions with a lower confidence, as there are not enough negative controls for them:gi|4506753|ref|NP_003698.1| gi|5730023|ref|NP_006657.1|. Please, use more negative controls.")
})

test_that("an error is returned upon non-numeric input", {
  expect_error(sfinx(do.call(structure, c(list(.Data=do.call(as.character,list(DataInputExampleFile))), attributes(DataInputExampleFile))),BaitIdentityExampleFile),
               "Your data are not purely numeric, or something is wrong with the header or rownames. Please check your data.")
})

test_that("an error is returned for lack of row or column names", {
  expect_error(sfinx(structure(.Data = DataInputExampleFile, dim = attributes(DataInputExampleFile)$dim, dimnames = list(attributes(DataInputExampleFile)$dimnames[[1]], NULL)),BaitIdentityExampleFile),
               "Your input data lack row names or column names. Please check your data.")
  expect_error(sfinx(structure(.Data = DataInputExampleFile, dim = attributes(DataInputExampleFile)$dim, dimnames = list(NULL, attributes(DataInputExampleFile)$dimnames[[2]])),BaitIdentityExampleFile),
               "Your input data lack row names or column names. Please check your data.")
})

test_that("an error is returned when none of the bait proteins can be found in the data", {
  expect_error(sfinx(DataInputExampleFile, toupper(BaitIdentityExampleFile)),
               "None of the bait proteins is present in the basic data matrix. Please check whether the names of the baits are appropriate for this dataset.")
})

test_that("an error is returned when incorrect types of parameters are used", {
  expect_error(sfinx(DataInputExampleFile, BaitIdentityExampleFile, BaitInfluence = "Kevin"),
               "The parameters BaitInfluence and ConstantLimit can only be TRUE or FALSE, no other types of entry are allowed. Please check these parameters.")
  expect_error(sfinx(DataInputExampleFile, BaitIdentityExampleFile, ConstantLimit = "Kevin"),
               "The parameters BaitInfluence and ConstantLimit can only be TRUE or FALSE, no other types of entry are allowed. Please check these parameters.")
  expect_error(sfinx(DataInputExampleFile, BaitIdentityExampleFile, FWERType = "Kevin"),
               "The parameter FWERType can only be B, HolmB or Sidak. Please check this parameter.")
  expect_error(sfinx(DataInputExampleFile, BaitIdentityExampleFile, BackgroundRatio =  "Kevin"),
               "The parameter BackgroundRatio is not numeric. Please correct this parameter.")
  expect_error(sfinx(DataInputExampleFile, BaitIdentityExampleFile, BackgroundRatio =  0L),
               "The parameter BackgroundRatio has a value below 2 or is not a natural number. Please correct this parameter.")
  expect_error(sfinx(DataInputExampleFile, BaitIdentityExampleFile, BackgroundIdentity = "Kevin"),
               "The BackgroundIdentity contains elements that are not present as column headings in the input data. Please evaluate the InputData and BackgroundIdentity parameters.")
  expect_error(sfinx(DataInputExampleFile, BaitIdentityExampleFile, BackgroundIdentity = NA),
               "The BackgroundIdentity contains elements that are not present as column headings in the input data. Please evaluate the InputData and BackgroundIdentity parameters.")
  expect_equal(sfinx(DataInputExampleFile, BaitIdentityExampleFile), sfinx(DataInputExampleFile, BaitIdentityExampleFile, BackgroundIdentity = NULL))
})



