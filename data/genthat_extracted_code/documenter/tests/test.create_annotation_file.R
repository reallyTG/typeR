context("create_annotation_file")

test_that(
  "invalid inputs produce an error",
  {
    # Generate data.
    set.seed(1)
    valid_title <- "A valid title"
    valid_annotation_file <- file.path(tempdir(), "annotation_file.yml")

    # Invalid title.
    expect_error({
      create_annotation_file(
        title = data.frame("a"=1,"b"=2),
        annotation_file = valid_annotation_file
      )
    })

    expect_error({
      create_annotation_file(
        title = c(1,2),
        annotation_file = valid_annotation_file
      )
    })

    expect_error({
      create_annotation_file(
        title = c("a","b"),
        annotation_file = valid_annotation_file
      )
    })

    # Invalid annotation_file.
    expect_error({
      create_annotation_file(
        title = valid_title,
        annotation_file = data.frame("a"=1,"b"=2)
      )
    })

    expect_error({
      create_annotation_file(
        title = valid_title,
        annotation_file = c(1,2)
      )
    })

    expect_error({
      create_annotation_file(
        title = valid_title,
        annotation_file = c("a","b")
      )
    })

    expect_error({
      dirtemp <- tempdir()
      valid_annotation_file <- file.path(dirtemp,"a", "annotation_file.yml")
      dir.create(file.path(dirtemp,"a"))
      create_annotation_file(
        title = valid_title,
        annotation_file = valid_annotation_file
      )
      create_annotation_file(
        title = valid_title,
        annotation_file = valid_annotation_file
      )
    })
  }
)

test_that(
  "valid inputs produce valid output",
  {
    # Generate data.
    set.seed(1)
    valid_title <- "A valid title"
    dirtemp <- tempdir()

    # title
    expect_silent({
      new_dir <- file.path(dirtemp,"b")
      if(dir.exists(new_dir)){
        unlink(new_dir, recursive = TRUE, force = TRUE)
      }
      dir.create(new_dir)
      valid_annotation_file <- file.path(new_dir, "annotation_file.yml")

      create_annotation_file(
        title = valid_title,
        annotation_file = valid_annotation_file
      )
    })

    # Fix title.
    expect_silent({
      new_dir <- file.path(dirtemp,"c")
      if(dir.exists(new_dir)){
        unlink(new_dir, recursive = TRUE, force = TRUE)
      }
      dir.create(new_dir)
      valid_annotation_file <- file.path(dirtemp, "annotation_file.yml")
      create_annotation_file(
        title = NULL,
        annotation_file = valid_annotation_file
      )
    })

    # Name annotation_file.
    expect_silent({
      new_dir <- file.path(dirtemp,"d")
      if(dir.exists(new_dir)){
        unlink(new_dir, recursive = TRUE, force = TRUE)
      }
      valid_annotation_file <- file.path(dirtemp, "annotation_file.yml")
      old_dir <- getwd()
      dir.create(new_dir)
      setwd(new_dir)
      create_annotation_file(
        title = NULL,
        annotation_file = NULL
      )
      setwd(old_dir)
    })
  }
)
