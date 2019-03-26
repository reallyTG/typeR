context("Tests for raws.profile")

test_that("Installation works", {
  skip_on_cran()
  result <- stringr::str_detect(Sys.which("aws"), "aws")
  expect_true(result)
})

test_that("Create_profile works", {
  skip_on_cran()
  create_profile(access_key = "1234",
                 secret_key = "1234",
                 region = "nowhere1")

  create_profile(profile = "john",
                 access_key = "4321",
                 secret_key = "4321",
                 region = "nowhere2")

  create_profile(profile = "doe",
                 access_key = "4132",
                 secret_key = "4132",
                 region = "nowhere3")

  # test if the credentials and config were created
    if(file.exists(paste0(Sys.getenv("HOME"),"/.aws/credentials")) &
       file.exists(paste0(Sys.getenv("HOME"),"/.aws/config"))){
    result <- TRUE
  } else {
    result <- FALSE
  }

  expect_true(result, info = "Credentials or config was not created")

  # test if the profile were created
  profiles <- list_profiles()
  expect_equal(profiles$profiles, c("default", "john", "doe"),
               info = "Profiles were not created correctly")

  # test delete_profile()
  delete_profile(c("john", "doe"))
  profiles <- list_profiles()
  expect_equal(profiles$profiles, "default",
               info = "delete_profile() is not working")

  # test delete_all_profiles()
  delete_all_profiles()

 if(file.exists(paste0(Sys.getenv("HOME"),"/.aws/credentials")) &
       file.exists(paste0(Sys.getenv("HOME"),"/.aws/config"))){
    result <- FALSE
  } else {
    result <- TRUE
  }

  expect_true(result, info = "delete_all_profiles is not working")
})

