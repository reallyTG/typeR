context("construct_rcreds_file_full_path")

test_that(desc="construct_rcreds_file_full_path", code={
  stopifnot(require(magrittr))

  FOLDER <- tempdir()

  set_default_rcreds_folder(folder=FOLDER, DB=FALSE)
  expect_equal(construct_rcreds_file_full_path("hello"), file.path(FOLDER, "hello"))

  expect_equal(construct_rcreds_file_full_path("hello", folder=file.path("some", "folder")), file.path("some", "folder", "hello"))

  expect_equal(construct_rcreds_file_full_path("hello", info="this_is_info", folder=file.path("some", "folder")), file.path("some", "folder", "this_is_info.hello"))
})


