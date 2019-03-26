library(tibbletime)


### Name: collapse_index
### Title: Collapse an index vector so that all observations in an interval
###   share the same date
### Aliases: collapse_index

### ** Examples


# Basic functionality -------------------------------------------------------

# Facebook stock prices
data(FB)
FB <- as_tbl_time(FB, date)

# Collapse to weekly dates
dplyr::mutate(FB, date = collapse_index(date, "weekly"))

# A common workflow is to group on the new date column
# to perform a time based summary
FB %>%
  dplyr::mutate(date = collapse_index(date, "yearly")) %>%
  dplyr::group_by(date) %>%
  dplyr::summarise_if(is.numeric, mean)

# You can also assign the result to a separate column and use that
# to nest on, allowing for 'period nests' that keep the
# original dates in the nested tibbles.
FB %>%
  dplyr::mutate(nest_date = collapse_index(date, "2 year")) %>%
  dplyr::group_by(nest_date) %>%
  tidyr::nest()

# Grouped functionality -----------------------------------------------------

data(FANG)
FANG <- FANG %>%
  as_tbl_time(date) %>%
  dplyr::group_by(symbol)

# Collapse each group to monthly,
# calculate monthly standard deviation for each column
FANG %>%
  dplyr::mutate(date = collapse_index(date, "monthly")) %>%
  dplyr::group_by(date, add = TRUE) %>%
  dplyr::summarise_all(sd)





