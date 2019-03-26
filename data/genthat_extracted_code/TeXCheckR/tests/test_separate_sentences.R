context("Separate sentences")

test_that("separate_sentences returns correct file", {
  file.copy("separate-sentences-in.tex",
            "separate-sentences-temp.tex",
            overwrite = TRUE)

  separate_sentences("separate-sentences-temp.tex")
  separate_sentences_temp <- readLines("separate-sentences-temp.tex")
  separate_sentences_out  <- readLines("separate-sentences-out.tex")

  separate_sentences_temp <- trimws(separate_sentences_temp)
  separate_sentences_out  <- trimws(separate_sentences_out)

  expect_identical(separate_sentences_out, separate_sentences_temp)
})


