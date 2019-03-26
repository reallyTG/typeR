context("\nrtext_loadsave") # ===============================================

context("rtext_loadsave save") # ===============================================

    test_that("rtext save", {
      expect_error({
        dings <-
          rtext_loadsave$new(
            text="1234567890"
          )
        dings$save()
      })
      expect_error({
        dings <- rtext_loadsave$new(
          text="1234567890",
          save_file=base::tempfile()
        )
        dings$save()
      }, NA)
      expect_error({
        dings <-
          rtext_loadsave$new(
            text_file=testfile("test_utf8.txt"),
            save_file=base::tempfile()
          )
        dings$save()
      }, NA)
      expect_error({
        dings <-
          rtext_loadsave$new(
            text="1234567890",
            text_file=testfile("rc_1.txt"),
            save_file=base::tempfile()
          )
        dings$save()
      }, NA)
    })




context("rtext_loadsave load") # ===============================================
test_that("rtext load is same as save", {
  expect_error({
    save_file <- base::tempfile(fileext = "Rdata")
    dings <-
      rtext_loadsave$new( text="1234567890" )
    dings$save(file = save_file)
    dings$load()
  })

  expect_error({
    save_file <- base::tempfile(fileext = "Rdata")
    dings <-
      rtext_loadsave$new( text="1234567890" )
    dings$save(file = save_file)
    dings$load(save_file)
  },NA)

  expect_error({
    save_file <- base::tempfile(fileext = "Rdata")
    dings <-
      rtext_loadsave$new( text="1234567890" )
    dings$save(file = save_file)
    dings$load(file = save_file)
  },NA)

  expect_true({
    # file to save in
    save_file <- base::tempfile(fileext = "Rdata")
    # original
    dings_original <-
      rtext_loadsave$new(
        text_file = rtext:::testfile("test_utf8.txt"),
        id        = "bollocks",
        save_file = base::tempfile()
      )
    # saving
    dings_original$save(file = save_file)
    # loading
    dings_loaded <- rtext_loadsave$new()
    dings_loaded$load(save_file)
    # comparing
    all(
      dings_original$encoding             == dings_loaded$encoding,
      dings_original$id                   == dings_loaded$id,
      dings_original$sourcetype           == dings_loaded$sourcetype,
      as.character(dings_original$info()) == as.character(dings_loaded$info()),
      identical(dings_original$save_file, dings_loaded$save_file),
      identical(dings_original$text_file, dings_loaded$text_file),
      dings_original$text_get(Inf)        == dings_loaded$text_get(Inf),
      dings_original$char_get(Inf)        == dings_loaded$char_get(Inf)
    )
  })

  expect_true({
    save_file <- base::tempfile(fileext = "Rdata")
    dings     <- rtext_loadsave$new(save_file=save_file)
    dings$save()
    tmp_env   <-  new.env(parent = emptyenv())
    tmp <- rtext:::load_into(save_file)

    all(
      !is.null(tmp$meta$rtext_version),
      !is.null(tmp$meta$r_version)
    )
  })
  expect_true({
    save_file <- base::tempfile(fileext = "Rdata")
    dings     <- rtext_loadsave$new(text_file=rtext:::testfile("test_latin1.txt"), encoding="latin1")
    dings$save(save_file)
    dongs <- rtext_loadsave$new()$load(save_file)

    all(dings$text_get() == dongs$text_get())
  })
})


























