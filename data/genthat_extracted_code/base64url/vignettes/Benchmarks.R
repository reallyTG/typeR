## ----include=FALSE,cache=FALSE-------------------------------------------
do.eval = requireNamespace("microbenchmark", quietly = TRUE)

## ---- eval=do.eval-------------------------------------------------------
library(base64url)
library(base64enc)
library(openssl)
library(microbenchmark)

x = "plain text"
microbenchmark(
  base64url = base64_urlencode(x),
  base64enc = base64encode(charToRaw(x)),
  openssl = base64_encode(x)
)

## ---- eval = do.eval-----------------------------------------------------
x = "N0JBLlRaUTp1bi5KOW4xWStNWEJoLHRQaDZ3"
microbenchmark(
  base64url = base64_urldecode(x),
  base64enc = rawToChar(base64decode(x)),
  openssl = rawToChar(base64_decode(x))
)

## ---- eval = do.eval-----------------------------------------------------
rand = function(n, min = 1, max = 32) {
  chars = c(letters, LETTERS, as.character(0:9), c(".", ":", ",", "+", "-", "*", "/"))
  replicate(n, paste0(sample(chars, sample(min:max, 1), replace = TRUE), collapse = ""))
}
set.seed(1)
rand(10)

## ---- eval = do.eval-----------------------------------------------------
base64enc_encode = function(x) {
  vapply(x, function(x) base64encode(charToRaw(x)), NA_character_, USE.NAMES = FALSE)
}

openssl_encode = function(x) {
  vapply(x, function(x) base64_encode(x), NA_character_, USE.NAMES = FALSE)
}

base64enc_decode = function(x) {
  vapply(x, function(x) rawToChar(base64decode(x)), NA_character_, USE.NAMES = FALSE)
}

openssl_decode = function(x) {
  vapply(x, function(x) rawToChar(base64_decode(x)), NA_character_, USE.NAMES = FALSE)
}

## ---- eval = do.eval-----------------------------------------------------
set.seed(1)
x = rand(1000)
microbenchmark(
  base64url = base64_urldecode(base64_urlencode(x)),
  base64enc = base64enc_decode(base64enc_encode(x)),
  openssl = openssl_decode(openssl_encode(x))
)

