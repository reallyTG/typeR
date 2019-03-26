library(gsheet)


### Name: construct_download_url
### Title: Construct a google sheet download url from the sheet's viewing
###   url
### Aliases: construct_download_url

### ** Examples


# Download a sheet manually using readr
url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'

if(requireNamespace('readr', quietly=TRUE)){
  library(readr)
  read_csv(construct_download_url(url), col_types = cols(
    mpg = col_double(),
    cyl = col_integer(),
    disp = col_double(),
    hp = col_integer(),
    drat = col_double(),
    wt = col_double(),
    qsec = col_double(),
    vs = col_integer(),
    am = col_integer(),
    gear = col_integer(),
    carb = col_integer()
  ))
}




