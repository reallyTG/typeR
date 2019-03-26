library(testthat)
library(jdx)

# jdx:::coerceCharacterToX -----------------------------------------------------

context("jdx:::coerceCharacterToX")

test_that(
  "jdx:::coerceCharacterToX - NULL, empty, NA"
  , {
    expect_identical(NULL, jdx:::coerceCharacterToX(NULL))
    expect_identical(character(), jdx:::coerceCharacterToX(character()))
    expect_identical(c(NA_character_, NA_character_), jdx:::coerceCharacterToX(c(NA_character_, NA_character_)))
  }
)

test_that(
  "jdx:::coerceCharacterToX - Errors"
  , {
    expect_error(jdx:::coerceCharacterToX(1:2), "Only character vectors are supported.")
    expect_error(jdx:::coerceCharacterToX(matrix(letters)), "Only character vectors are supported.")
  }
)

test_that(
  "jdx:::coerceCharacterToX - numeric"
  , {
    valueIn <- c("1.0")
    valueOut <- c(1)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("1", "1.0")
    valueOut <- c(1, 1)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("1.1", "Inf")
    valueOut <- c(1.1, Inf)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("-1.1", "-Inf")
    valueOut <- c(-1.1, -Inf)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("1", "Inf")
    valueOut <- c(1, Inf)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("1.1", NA)
    valueOut <- c(1.1, NA)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c(NA, "1.1")
    valueOut <- c(NA, 1.1)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    # Note that "NA" is returned now, not NA. See comments above
    # coerceCharacterToX function.
    valueIn <- c("NA", "1.1")
    valueOut <- valueIn
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    expect_identical(c(NaN), jdx:::coerceCharacterToX(c("NaN")))
    
    expect_identical(c(NaN, NaN), jdx:::coerceCharacterToX(c("NaN", "NaN")))
    
    valueIn <- c("NaN", "1.1")
    valueOut <- c(NaN, 1.1)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("1.1", "NaN")
    valueOut <- c(1.1, NaN)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))

    # Test mixed types. These conversions will fail, returning the original 
    # vector.
    value <- c("1.1", "A")
    expect_identical(value, jdx:::coerceCharacterToX(value))
    value <- c("1.1", "TRUE")
    expect_identical(value, jdx:::coerceCharacterToX(value))

    # The "" should be converted to NA, causing the function to fail and return
    # the original vector.
    value <- c("1.1", "")
    expect_identical(value, jdx:::coerceCharacterToX(value))
  }
)

test_that(
  "jdx:::coerceCharacterToX - integer"
  , {
    valueIn <- c("1")
    valueOut <- c(1L)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("0x01")
    valueOut <- c(1L)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("1", NA)
    valueOut <- c(1L, NA)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c(NA, "1")
    valueOut <- c(NA, 1L)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    # Note that "NA" is returned now, not NA. See comments above
    # coerceCharacterToX function.
    valueIn <- c("1", "NA")
    valueOut <- valueIn
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c(as.character(.Machine$integer.max))
    valueOut <- c(.Machine$integer.max)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    # Test mixed types. These conversions will fail, returning the original
    # vector.
    value <- c("1", "A")
    expect_identical(value, jdx:::coerceCharacterToX(value))
    value <- c("1", "TRUE")
    expect_identical(value, jdx:::coerceCharacterToX(value))
    
    # strtoi converts "" to zero by default, which we don't want. We want "" to
    # cause the conversion to fail.
    value <- c("1", "")
    expect_identical(value, jdx:::coerceCharacterToX(value))
  }
)

test_that(
  "jdx:::coerceCharacterToX - logical"
  , {
    valueIn <- c("T")
    valueOut <- c(TRUE)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("TRUE")
    valueOut <- c(TRUE)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("F")
    valueOut <- c(FALSE)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("FALSE")
    valueOut <- c(FALSE)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("TRUE", NA)
    valueOut <- c(TRUE, NA)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    valueIn <- c("FALSE", NA)
    valueOut <- c(FALSE, NA)
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    # Note that "NA" is returned now, not NA. See comments above
    # coerceCharacterToX function.
    valueIn <- c("TRUE", "NA")
    valueOut <- valueIn
    expect_identical(valueOut, jdx:::coerceCharacterToX(valueIn))
    
    # Test mixed types These conversions will fail, returning the original
    # vector.
    value <- c("TRUE", "A")
    expect_identical(value, jdx:::coerceCharacterToX(value))
    value <- c("TRUE", "1")
    expect_identical(value, jdx:::coerceCharacterToX(value))
    value <- c("TRUE", "1.1")
    expect_identical(value, jdx:::coerceCharacterToX(value))
    value <- c("TRUE", "NaN")
    expect_identical(value, jdx:::coerceCharacterToX(value))
    
    # The "" should be converted to NA, causing the function to fail and return
    # the original vector.
    value <- c("TRUE", "")
    expect_identical(value, jdx:::coerceCharacterToX(value))
  }
)


# jdx:::coerceFactor ------------------------------------------------------------

context("jdx:::coerceFactor")

test_that(
  "jdx:::coerceFactor - NULL and empty"
  , {
    expect_identical(NULL, jdx:::coerceFactor(NULL))
    expect_identical(character(), jdx:::coerceFactor(factor()))
    expect_identical(character(), jdx:::coerceFactor(as.factor(character())))
    expect_identical(character(), jdx:::coerceFactor(as.factor(numeric())))
    expect_identical(character(), jdx:::coerceFactor(as.factor(integer())))
    expect_identical(character(), jdx:::coerceFactor(as.factor(logical())))
  }
)

test_that(
  "jdx:::coerceCharacterToX - Errors"
  , {
    expect_error(jdx:::coerceFactor(1:2), "A factor is required.")
    expect_error(jdx:::coerceFactor(letters), "A factor is required.")
  }
)

test_that(
  "jdx:::coerceFactor - character"
  , {
    value <- NA_character_
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- "a"
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- letters
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(letters, NA, "", " ")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
  }
)

test_that(
  "jdx:::coerceFactor - numeric"
  , {
    value <- c(1.1, 2.2, Inf, -Inf)
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(1, Inf)
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(1, 2.2)
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(1.1, NA)
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(pi)
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(1.1, NaN)
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    # See comments for coerceCharacterToX for an explanation of why mixed types
    # are not coerced.
    value <- c("1.1", "A")
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("1.1", "TRUE")
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("1.1", "NA") 
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("1.1", "")
    expect_equal(value, jdx:::coerceFactor(as.factor(value)))
  }
)

test_that(
  "jdx:::jdx:::coerceFactor - integer"
  , {
    value <- 0L
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- -1:20
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(1L, NA, .Machine$integer.max, -.Machine$integer.max)
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    # See comments for coerceCharacterToX for an explanation of why mixed types
    # are not coerced.
    value <- c("1", "A")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("1", "TRUE")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("1", "NA")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("1", "")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
  }
)

test_that(
  "jdx:::jdx:::coerceFactor - logical"
  , {
    value <- c(TRUE)
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(TRUE, NA)
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(FALSE)
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c(FALSE, NA)
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    # See comments for coerceCharacterToX for an explanation of why mixed types
    # are not coerced.
    value <- c("TRUE", "A")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("TRUE", "1")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("TRUE", "1.1")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("TRUE", "NA")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("TRUE", "NaN")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
    value <- c("TRUE", "")
    expect_identical(value, jdx:::coerceFactor(as.factor(value)))
  }
)
