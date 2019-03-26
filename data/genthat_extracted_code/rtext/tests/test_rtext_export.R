context("\nrtext_export") # ===============================================


context("rtext_export prepare_save() and execute_load()") # ===============================================

dings <- rtext$new( text="1234567890" )
dings$debug()

test_that("rtext_export prepare_save() and execute_load()", {
  expect_error({
    tmp <- private$prepare_save()
  }, NA)
  expect_error({
    private$execute_load(tmp)
  }, NA)
  expect_error({
    dings$char_data_set("x33", 1:10, 10:1)
    dings$char_data_set("x12", sample(1:10,3))
    dings$char_data_set("x11", sample(1:10,3), sample(1:10,3))
    tmp <- private$prepare_save()
  }, NA)
  expect_error({
    private$execute_load(tmp)
  }, NA)
})






context("rtext_export export_sqlite") # ===============================================

test_that("rtext export_sqlite works", {

    expect_error({
    dings <- rtext$new(
      text="1234567890"
    )
    dings$export_sqlite()
  }, NA)
  expect_error({
    dings <- rtext$new(
      text="1234567890"
    )
    tryCatch(file.remove("test.db"), warning=function(w){} )
    dings$export_sqlite("test.db")
    dings$export_sqlite("test.db")
  }, NA)

  expect_error({
    dings <-
      rtext$new(
        text_file=rtext:::testfile("test_utf8.txt"),
        save_file=base::tempfile()
      )
    tryCatch(file.remove("test.db"), warning=function(w){} )
    dings$export_sqlite("test.db")
  }, NA)

  expect_error({
    dings <-
      rtext$new(
        text="1234567890",
        text_file=testfile("rc_1.txt"),
        save_file=base::tempfile()
      )
    tryCatch(file.remove("test.db"), warning=function(w){} )
    dings$export_sqlite("test.db")
  }, NA)

  expect_error({
    dings <-
      rtext$new(
        text="1234567890",
        text_file=testfile("rc_1.txt"),
        save_file=base::tempfile()
      )
    tryCatch(file.remove("test.db"), warning=function(w){} )
    dings$export_sqlite("test.db")
  }, NA)
})




context("rtext_export import_sqlite") # ===============================================
test_that("rtext_export import_sqlite", {
  # original
  dings_original <-
    rtext$new(
      text_file = rtext:::testfile("test_utf8.txt"),
      id        = "bollocks"
    )
  # saving
  test_db <- tempfile()
  dings_original$export_sqlite(test_db)
  # loading
  dings_loaded <- rtext$new()
  dings_loaded$import_sqlite(test_db)

  # tests
  expect_true({
    dings_original$encoding             == dings_loaded$encoding
  })
  expect_true({
    dings_original$id                   == dings_loaded$id
  })
  expect_true({
    dings_original$sourcetype           == dings_loaded$sourcetype
  })
  expect_true({
    all(
      as.character(dings_original$info()) ==
      as.character(dings_loaded$info())
    )
  })
  expect_true({
    identical(dings_original$save_file, dings_loaded$save_file)
  })
  expect_true({
    identical(dings_original$text_file, dings_loaded$text_file)
  })
  expect_true({
    all(
      dings_original$text_get(Inf)        == dings_loaded$text_get(Inf)
    )
  })
  expect_true({
    all(
      dings_original$char_get(Inf) ==
      dings_loaded$char_get(Inf)
    )
  })
})


test_that("rtext_export import_sqlite", {
  # original
  dings_original <-
    rtext$new(
      text_file = rtext:::testfile("test_latin1.txt"),
      encoding  = "latin1",
      id        = "bollocks"
    )
  # saving
  test_db <- tempfile()
  dings_original$export_sqlite(test_db)
  # loading
  dings_loaded <- rtext$new()
  dings_loaded$import_sqlite(test_db)

  # tests
  expect_true({
    dings_original$encoding             == dings_loaded$encoding
  })
  expect_true({
    dings_original$id                   == dings_loaded$id
  })
  expect_true({
    dings_original$sourcetype           == dings_loaded$sourcetype
  })
  expect_true({
    all(
      as.character(dings_original$info()) ==
      as.character(dings_loaded$info())
    )
  })
  expect_true({
    identical(dings_original$save_file, dings_loaded$save_file)
  })
  expect_true({
    identical(dings_original$text_file, dings_loaded$text_file)
  })
  expect_true({
    all(
      dings_original$text_get(Inf) ==
      dings_loaded$text_get(Inf)
    )
  })
  expect_true({
    all(
      dings_original$char_get(Inf)        == dings_loaded$char_get(Inf)
    )
  })
})

























