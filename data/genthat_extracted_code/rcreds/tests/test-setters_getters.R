context("Setters and Getters")


test_that(desc="setters_getters_for_key", code={
  stopifnot(require(magrittr))
  clear_default_rcreds_key_folder()
 
  ## ------------------------------------------------------------------ ##
  ## No folder set, this should error or warn, unless flagged otherwise
  ## ------------------------------------------------------------------ ##
  ## default values
  expect_error(get_default_rcreds_key_folder())

  ## Explicit value
  expect_error(get_default_rcreds_key_folder(fail_if_not_set=TRUE))

  ## Turning off fail_if_not_set
  expect_warning(get_default_rcreds_key_folder(fail_if_not_set=FALSE))
  expect_null(get_default_rcreds_key_folder(fail_if_not_set=FALSE, showWarnings = FALSE))

  ## Turning off fail_if_not_set and showWarnings
  expect_null(get_default_rcreds_key_folder(fail_if_not_set=FALSE, showWarnings=FALSE))
  expect_silent(get_default_rcreds_key_folder(fail_if_not_set=FALSE, showWarnings=FALSE))

  ## NO ENDING SLASH THEN ENDING SLASH
  FOLDERS <- tempdir() %>% file.path("keys", "some", "sub", "folder") %>% c(file.path(., "with_slash", ""))
  for (FOLDER_TESTING in FOLDERS) {
    ## Since folder does not exist, we should get a warning
    expect_false(file.exists(FOLDER_TESTING), label="First time testing FOLDER_TESTING")
    expect_warning(set_default_rcreds_key_folder(FOLDER_TESTING))
    expect_output(set_default_rcreds_key_folder(FOLDER_TESTING, showWarnings = FALSE), "^Setting the default rcreds key folder to '.+'$")
    expect_false(file.exists(FOLDER_TESTING), label="After setting defaults, before creating")

    expect_warning(get_default_rcreds_key_folder())
    expect_silent(get_default_rcreds_key_folder(showWarnings=FALSE))
    expect_equal(get_default_rcreds_key_folder(showWarnings=FALSE), FOLDER_TESTING)
    expect_equal(get_default_rcreds_key_folder(showWarnings=FALSE), FOLDER_TESTING)

    expect_false(file.exists(FOLDER_TESTING), label = "Right before creating FOLDER_TESTING ")
    expect_output(set_default_rcreds_key_folder(FOLDER_TESTING, showWarnings = FALSE, create_if_not_exist=TRUE), "Folder does not exist. Creating it. \\nSetting the default rcreds key folder to '.+'$")
    expect_true(file.exists(FOLDER_TESTING), label = "After create_if_not_exist")

    expect_equal(get_default_rcreds_key_folder(showWarnings=FALSE), FOLDER_TESTING)
    expect_equal(get_default_rcreds_key_folder(showWarnings=FALSE), FOLDER_TESTING)
  }
})

test_that(desc="setters_getters_for_db", code={
  stopifnot(require(magrittr))
  clear_default_rcreds_folder()
  clear_default_rcreds_folder(DB=TRUE)
 
  ## ------------------------------------------------------------------ ##
  ## No folder set, this should error or warn, unless flagged otherwise
  ## ------------------------------------------------------------------ ##
  ## default values
  expect_error(get_default_rcreds_folder(DB=TRUE))

  ## Explicit value
  expect_error(get_default_rcreds_folder(DB=TRUE, fail_if_not_set=TRUE))

  ## Turning off fail_if_not_set
  expect_warning(get_default_rcreds_folder(DB=TRUE, fail_if_not_set=FALSE))
  expect_null(get_default_rcreds_folder(DB=TRUE, fail_if_not_set=FALSE, showWarnings=FALSE))


  ## Turning off fail_if_not_set and showWarnings
  expect_null(get_default_rcreds_folder(DB=TRUE, fail_if_not_set=FALSE, showWarnings=FALSE))
  expect_silent(get_default_rcreds_folder(DB=TRUE, fail_if_not_set=FALSE, showWarnings=FALSE))

  ## NO ENDING SLASH THEN ENDING SLASH
  FOLDERS <- tempdir() %>% file.path("db", "some", "sub", "folder") %>% c(file.path(., "with_slash", ""))
  for (FOLDER_TESTING in FOLDERS) {
    ## Since folder does not exist, we should get a warning
    expect_false(file.exists(FOLDER_TESTING), label="First time testing FOLDER_TESTING")
    expect_warning(set_default_rcreds_folder(DB=TRUE, FOLDER_TESTING))
    expect_output(set_default_rcreds_folder(DB=TRUE, FOLDER_TESTING, showWarnings=FALSE), "^Setting the default rcreds db folder to '.+'$")
    expect_false(file.exists(FOLDER_TESTING), label="After setting defaults, before creating")

    expect_warning(get_default_rcreds_folder(DB=TRUE))
    expect_silent(get_default_rcreds_folder(DB=TRUE, showWarnings=FALSE))
    expect_equal(get_default_rcreds_folder(DB=TRUE, showWarnings=FALSE), FOLDER_TESTING)
    expect_equal(get_default_rcreds_folder(DB=TRUE, showWarnings=FALSE), FOLDER_TESTING)

    expect_false(file.exists(FOLDER_TESTING), label = "Right before creating FOLDER_TESTING ")
    expect_output(set_default_rcreds_folder(DB=TRUE, FOLDER_TESTING, showWarnings=FALSE, create_if_not_exist=TRUE), "Folder does not exist. Creating it. \\nSetting the default rcreds db folder to '.+'$")
    expect_true(file.exists(FOLDER_TESTING), label = "After create_if_not_exist")

    expect_equal(get_default_rcreds_folder(DB=TRUE), FOLDER_TESTING)
    expect_equal(get_default_rcreds_folder(DB=TRUE, showWarnings=FALSE), FOLDER_TESTING)
  }
})

test_that(desc="setters_getters_for_regular", code={
  stopifnot(require(magrittr))
  clear_default_rcreds_folder()
  clear_default_rcreds_folder(DB=FALSE)
 
  ## ------------------------------------------------------------------ ##
  ## No folder set, this should error or warn, unless flagged otherwise
  ## ------------------------------------------------------------------ ##
  ## default values
  expect_error(get_default_rcreds_folder(DB=FALSE))

  ## Explicit value
  expect_error(get_default_rcreds_folder(DB=FALSE, fail_if_not_set=TRUE))

  ## Turning off fail_if_not_set
  expect_warning(get_default_rcreds_folder(DB=FALSE, fail_if_not_set=FALSE))
  expect_null(get_default_rcreds_folder(DB=FALSE, showWarnings=FALSE, fail_if_not_set=FALSE))

  ## Turning off fail_if_not_set and showWarnings
  expect_null(get_default_rcreds_folder(DB=FALSE, fail_if_not_set=FALSE, showWarnings=FALSE))
  expect_silent(get_default_rcreds_folder(DB=FALSE, fail_if_not_set=FALSE, showWarnings=FALSE))

  ## NO ENDING SLASH THEN ENDING SLASH
  FOLDERS <- tempdir() %>% file.path("credentials", "some", "sub", "folder") %>% c(file.path(., "with_slash", ""))
  for (FOLDER_TESTING in FOLDERS) {
    ## Since folder does not exist, we should get a warning
    expect_false(file.exists(FOLDER_TESTING), label="First time testing FOLDER_TESTING")
    expect_warning(set_default_rcreds_folder(DB=FALSE, FOLDER_TESTING))
    expect_output(set_default_rcreds_folder(DB=FALSE, showWarnings=FALSE, FOLDER_TESTING), "^Setting the default rcreds folder to '.+'$")
    expect_false(file.exists(FOLDER_TESTING), label="After setting defaults, before creating")

    expect_warning(get_default_rcreds_folder(DB=FALSE))
    expect_silent(get_default_rcreds_folder(DB=FALSE, showWarnings=FALSE))
    expect_equal(get_default_rcreds_folder(DB=FALSE, showWarnings=FALSE), FOLDER_TESTING)
    expect_equal(get_default_rcreds_folder(DB=FALSE, showWarnings=FALSE), FOLDER_TESTING)

    expect_false(file.exists(FOLDER_TESTING), label = "Right before creating FOLDER_TESTING ")
    expect_output(set_default_rcreds_folder(DB=FALSE, FOLDER_TESTING, create_if_not_exist=TRUE), "Folder does not exist. Creating it. \\nSetting the default rcreds folder to '.+'$")
    expect_true(file.exists(FOLDER_TESTING), label = "After create_if_not_exist")

    expect_equal(get_default_rcreds_folder(DB=FALSE), FOLDER_TESTING)
    expect_equal(get_default_rcreds_folder(DB=FALSE, showWarnings=FALSE), FOLDER_TESTING)
  }

  ## EXTRA TESTING -- no DB parameter
  expect_equal(get_default_rcreds_folder(), FOLDER_TESTING)

  FOLDER3 <- tempdir() %>% file.path("testing", "default")
  set_default_rcreds_folder(FOLDER3, create_if_not_exist=TRUE)
  expect_equal(get_default_rcreds_folder(), FOLDER3)
})


test_that(desc="setters_getters_looking_for_collisions", code={
  stopifnot(require(magrittr))

  FOLDER_DB    <- tempdir() %>% file.path("subfolders", "DB")
  FOLDER_KEY   <- tempdir() %>% file.path("subfolders", "KEY")
  FOLDER_CREDS <- tempdir() %>% file.path("subfolders", "CREDS")

  expect_output(set_default_rcreds_folder(FOLDER_DB,    DB=TRUE, showWarnings=FALSE),  "^Setting the default rcreds db folder to '.+'$")
  expect_output(set_default_rcreds_folder(FOLDER_CREDS, DB=FALSE, showWarnings=FALSE), "^Setting the default rcreds folder to '.+'$")
  expect_output(set_default_rcreds_key_folder(FOLDER_KEY, showWarnings=FALSE),         "^Setting the default rcreds key folder to '.+'$")

  expect_equal(get_default_rcreds_folder(DB=TRUE, showWarnings=FALSE),  FOLDER_DB)
  expect_equal(get_default_rcreds_folder(DB=FALSE, showWarnings=FALSE), FOLDER_CREDS)
  expect_equal(get_default_rcreds_key_folder(showWarnings=FALSE),     FOLDER_KEY)

  expect_output(clear_default_rcreds_folder(), "^Clearing default rcreds  folder, which was previously set to  '.+' $")
  expect_equal(get_default_rcreds_folder(DB=TRUE, showWarnings=FALSE),  FOLDER_DB)
  expect_equal(get_default_rcreds_key_folder(showWarnings=FALSE),     FOLDER_KEY)
})


