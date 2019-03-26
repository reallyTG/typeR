library(gsheet)


### Name: gsheet2tbl
### Title: Download Google sheet as a table
### Aliases: gsheet2tbl

### ** Examples


# Download a sheet
url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
a <- gsheet2tbl(url)

# Download the second sheet, using the direct url
url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo#gid=850032961'
b <- gsheet2tbl(url)

# To download a sheet with more control, use the following:
url <- 'docs.google.com/spreadsheets/d/1I9mJsS5QnXF2TNNntTy-HrcdHmIF9wJ8ONYvEJTXSNo'
read.csv(text=gsheet2text(url, format='csv'), stringsAsFactors=FALSE)

# Or, with readr:
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




