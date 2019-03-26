context("base64 encode/decode")

test_that("encoding an example produces expected results", {
  input <- paste0(
    "The quick brown fox jumps over the lazy dog. 1!2@3#4$5%6^7&8*9(0)-",
    "_=+`~|[{]};:/?.>,<"
  )
  output <- base64_encode(charToRaw(input))
  # the following encoding is based on: https://www.base64encode.net/
  expected_output <- paste0(
    "VGhlIHF1aWNrIGJyb3duIGZveCBqdW1wcyBvdmVyIHRoZSBsYXp5IGRvZy4gMSEyQD",
    "MjNCQ1JTZeNyY4KjkoMCktXz0rYH58W3tdfTs6Lz8uPiw8"
  )
  expect_equal(output, expected_output)
})

test_that("decoding encoded strings produces original string", {
  original <- "123456"
  encoded <- base64_encode(charToRaw(original))
  decoded <- base64_decode(encoded)
  expect_equal(original, rawToChar(decoded))

  original <- paste0(
    "The quick brown fox jumps over the lazy dog. 1!2@3#4$5%6^7&8*9(0)-",
    "_=+`~|[{]};:/?.>,<"
  )
  encoded <- base64_encode(charToRaw(original))
  decoded <- base64_decode(encoded)
  expect_equal(original, rawToChar(decoded))
})

test_that("padding characters are appended as expected", {
  # encoded strings should be 4/3 the length of the original string, however,
  # the encoded strings must have lengths divisible by 4.

  encoded <- base64_encode(charToRaw("123"))
  expect_equal(nchar(encoded), 4)
  expect_false(grepl("=", encoded))  # should include zero padding characters

  encoded <- base64_encode(charToRaw("1234"))
  expect_equal(nchar(encoded), 8)
  expect_match(encoded, "==")

  encoded <- base64_encode(charToRaw("12345"))
  expect_equal(nchar(encoded), 8)
  expect_match(encoded, "=")

  encoded <- base64_encode(charToRaw("123456"))
  expect_equal(nchar(encoded), 8)
  expect_false(grepl("=", encoded))  # should include zero padding characters

  encoded <- base64_encode(charToRaw("1234567"))
  expect_equal(nchar(encoded), 12)
  expect_match(encoded, "==")
})
