library(readabs)


### Name: tidy_abs
### Title: Tidy ABS time series data.
### Aliases: tidy_abs

### ** Examples


# First extract the data from the local spreadsheet

## Not run: wpi <- extract_abs_sheets("634501.xls")

# Then tidy the data extracted from the spreadsheet. Note that
# \code{extract_abs_sheets()} returns a list of data frames, so we need to
# subset the list.

## No test: 
tidy_wpi <- tidy_abs(wpi[[1]])
## End(No test)




