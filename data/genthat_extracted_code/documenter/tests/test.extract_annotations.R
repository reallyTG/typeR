context("extract_annotations")

test_that(
  "valid inputs produce valid output",
  {
    # Generate data.
    set.seed(1)
    default_annotation_file <- yaml::read_yaml(system.file(
      package = "documenter",
      "extdata", "example", "annotation_file.yml"
    ))
    annotation_file_1 <- yaml::read_yaml(system.file(
      package = "documenter",
      "extdata", "example", "test_annotation_file_1.yml"
    ))
    annotation_file_2 <- yaml::read_yaml(system.file(
      package = "documenter",
      "extdata", "example", "test_annotation_file_2.yml"
    ))

    # title
    expect_silent({
      yml <- extract_annotations(default_annotation_file, "A title")
    })

    expect_silent({
      yml <- extract_annotations(annotation_file_1, "A title")
    })

    # An empty file.
    expect_silent({
      yml <- extract_annotations(annotation_file_2, "A title")
    })

    # Invalid yml object.
    expect_silent({
      extract_annotations("A string", "A title")
    })
  }
)
