library(testthat)
library(TCIApathfinder)

api_key <- Sys.getenv("TCIA_API_KEY")
if (!identical(api_key, "")) {
  test_check("TCIApathfinder")
}
