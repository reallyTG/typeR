context("read_write")



test_that(desc="regular_functions", code={

  set_default_rcreds_ALL(parent_folder=file.path(tempdir(), ".rcreds"), create_if_not_exist = TRUE)

  test_folder <- file.path(tempdir(), "rpkgs_test_folder", "rcreds")
  dir.create(test_folder, recursive = TRUE, showWarnings = FALSE)

  ret <- write_credentials_to_file(
      username = "I am the user"
    , password = "super secret batman"
    , list_value = list("is", 1:5, c("even", "possible?"))
    , empty_value = c()
    , empty_string = ""
    , folder = test_folder
  )

  received_value <- read_credentials_from_file(folder=test_folder)

  expected_value <- list(
      username = "I am the user"
    , password = "super secret batman"
    , list_value = list("is", 1:5, c("even", "possible?"))
    , empty_value = structure(list(), .Names = character(0))
    , empty_string = ""
  )

  ## SAME
  expect_equal(received_value, expected_value)

  ## USE SOME OTHER KEY
  key3 <- create_key()
  expect_error(read_credentials_from_file(folder=test_folder, key=key3))
})

test_that(desc="DB Funcs", code={

  set_default_rcreds_ALL(parent_folder=file.path(tempdir(), ".rcreds"), create_if_not_exist = TRUE)

  test_folder <- file.path(tempdir(), "rpkgs_test_folder", "rcreds")
  dir.create(test_folder, recursive = TRUE, showWarnings = FALSE)

  ## expect warning for writing NULL
  expect_warning(regexp = "^At least one element being written is NULL.*", 
    ret <- write_db_credentials_to_file(
        dbname          = "this_is_the_db"
      , port            = 1234L
      , host            = "very graceful"
      , username        = "hopscotch"
      , password        = "hopgin"
      , something_else  = list(testing = 1:5, more_stuff = LETTERS, null_value = NULL, value = "A")
      , folder          = test_folder
    )
  )

  received_value <- read_db_credentials_from_file(folder=test_folder)

  expected_value <- list(    
      dbname          = "this_is_the_db"
    , host            = "very graceful"
    , port            = 1234L
    , username        = "hopscotch"
    , password        = "hopgin"
    , something_else  = list(testing = 1:5, more_stuff = LETTERS, null_value = structure(list(), .Names = character(0)), value = "A")
  )

  ## The ordering of the 
  expect_equal(received_value[order(names(received_value))], expected_value[order(names(expected_value))])
  expect_equal(received_value, expected_value)

  ## USE SOME OTHER KEY
  key2 <- create_key()
  expect_error(read_db_credentials_from_file(folder=test_folder, key=key2))
})
