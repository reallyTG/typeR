context("Overwrite Checks")
## Can I overwrite a key file, by accident?


test_that(desc="Checking Overwriting Abilities", code={
  stopifnot(require(magrittr))

  set_default_rcreds_ALL(tempdir(), create=TRUE)
 
  ## CREATE A KEY
  expect_message(key_object_1 <- rcreds::create_key(), "^Creating new key with bytes = 32  and  depth = 8\\.  seed was not set\\.\\n$")

  ## SAVE THE KEY
  expect_message(file.key_object_1 <- save_key(key = key_object_1), "^key file written to .+$")

  ## WRITE SOME CREDS
  ret <- write_credentials_to_file(
      username = "I am the user"
    , password = "super secret batman"
    , list_value = list("is", 1:5, c("even", "possible?"))
  )

  received_value <- read_credentials_from_file()

  expected_value <- list(
      username = "I am the user"
    , password = "super secret batman"
    , list_value = list("is", 1:5, c("even", "possible?"))
  )

  ## SAME
  expect_equal(received_value, expected_value)


  ## SAVE A NEW CRED
  ret_new <- write_credentials_to_file(
      username = "New User Name"
    , password = "New Password"
  )

  received_value_new <- read_credentials_from_file()

  ## Should be different
  expect_true(length(received_value_new) < length(received_value))
  for (i in seq_along(ret_new)) {
    nm <- names(received_value_new)[[i]]
    expect_false(received_value_new[[nm]] == received_value[[nm]])
  }

  ## saving a new key will then make the original files un-encryptable with defaults
  key_2 <- create_key()
  save_key(key = key_2)

  expect_error(read_credentials_from_file(), "^Could not decrypt the file. This is probably due to the wrong key being used.")
})
