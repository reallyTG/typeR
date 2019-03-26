context("document_it")

test_that(
  "invalid inputs produce an error",
  {
    # Generate data.
    set.seed(1)
    valid_input_dir <- system.file(
      package = "documenter",
      "extdata", "example"
    )
    valid_output_file <- file.path(tempdir(), "documentation")

    # Invalid input_directory.
    expect_error({
      document_it(
        input_directory = NULL,
        output_file = valid_output_file,
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = data.frame("a"=1,"b"=2),
        output_file = valid_output_file,
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = c(1),
        output_file = valid_output_file,
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = c("a","b"),
        output_file = valid_output_file,
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = valid_output_file,
        output_file = valid_output_file,
        annotation_file = NULL
      )
    })

    # Invalid output_file.
    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = NULL,
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = data.frame("a"=1,"b"=2),
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = c(1),
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = c("a","b"),
        annotation_file = NULL
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = "",
        annotation_file = NULL
      )
    })

    # Invalid annotation_file.
    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = data.frame("a"=1,"b"=2)
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = c(1)
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = c("a","b")
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = ""
      )
    })

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = "a_non_existent_file"
      )
    })

    expect_error({
      new_dir <- file.path(valid_input_dir,"empty_dir")
      document_it(
        input_directory = new_dir,
        output_file = valid_output_file,
        annotation_file = NULL
      )
    })
  }
)

test_that(
  "valid inputs produce valid output",
  {
    # Generate data.
    set.seed(1)
    valid_input_dir <- system.file(
      package = "documenter",
      "extdata", "example"
    )
    new_output_dir <- tempdir()
    valid_output_file <- file.path(new_output_dir, "test")

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = NULL
      )
    }, NA)

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = system.file(
          package = "documenter",
          "extdata", "example", "annotation_file.yml"
        )
      )
    }, NA)

    expect_error({
      document_it(
        input_directory = valid_input_dir,
        output_file = valid_output_file,
        annotation_file = system.file(
          package = "documenter",
          "extdata", "example", "test_annotation_file_1.yml"
        )
      )
    }, NA)
  }
)
