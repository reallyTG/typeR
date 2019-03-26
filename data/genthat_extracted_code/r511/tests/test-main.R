library(r511)
context('Getting metadata and data from 511')

working <- function() {
  url <- "https://developers.google.com/transit/gtfs/examples/sample-feed.zip"
  connecting <- function(url) {
    r <- base::try(httr::GET(url, httr::timeout(5)))
    if(!assertthat::is.error(r)) r$status_code == 200 else FALSE
  }
  connecting(url)
}

#import_gtfs()
test_that('Import metadata and a GTFS object from 511', {
  skip_on_cran()
  key511 <- Sys.getenv('APIKEY511')
  if(working()==FALSE){
    skip("no internet, skipping")
  }
  else if (identical(key511, "")) {
    skip("no 511 api key, skipping")
  }
  else {
    operator_df <- get_511_metadata()
    expect_is(operator_df, 'tbl_df')

    bart_code <- operator_df[operator_df$name=='Bay Area Rapid Transit',]$privatecode
    zip_request_url <- get_511_url(bart_code)

    expect_is(zip_request_url, 'character')
  }
})
