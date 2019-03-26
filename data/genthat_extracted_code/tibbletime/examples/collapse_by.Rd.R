library(tibbletime)


### Name: collapse_by
### Title: Collapse a tbl_time object by its index
### Aliases: collapse_by

### ** Examples


# Basic functionality -------------------------------------------------------

# Facebook stock prices
data(FB)
FB <- as_tbl_time(FB, date)

# Collapse to weekly dates
collapse_by(FB, "weekly")

# A common workflow is to group on the collapsed date column
# to perform a time based summary
FB %>%
  collapse_by("yearly") %>%
  dplyr::group_by(date) %>%
  dplyr::summarise_if(is.numeric, mean)

# Grouped functionality -----------------------------------------------------

data(FANG)
FANG <- FANG %>%
  as_tbl_time(date) %>%
  dplyr::group_by(symbol)

# Collapse each group to monthly,
# calculate monthly standard deviation for each column
FANG %>%
  collapse_by("monthly") %>%
  dplyr::group_by(date, add = TRUE) %>%
  dplyr::summarise_all(sd)




