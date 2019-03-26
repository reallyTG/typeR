library(heatwaveR)


### Name: category
### Title: Calculate the categories of events.
### Aliases: category

### ** Examples

res_WA <- detect_event(ts2clm(sst_WA,
                       climatologyPeriod = c("1983-01-01", "2012-12-31")))
# Note that the name argument expects a character vector
cat_WA <- category(res_WA, name = "WA")
tail(cat_WA)

# If the data were collected in the northern hemisphere
# we must let the funciton know this, as seen below
res_Med <- detect_event(ts2clm(sst_Med,
                        climatologyPeriod = c("1983-01-01", "2012-12-31")))
cat_Med <- category(res_Med, S = FALSE, name = "Med")
tail(cat_Med)

# One may also choose to have this function output the daily
# category classifications as well by setting: climatology = TRUE
cat_WA_daily <- category(res_WA, name = "WA", climatology = TRUE)
head(cat_WA_daily$climatology)

# Note that this will not return the complete time series, only the
# days during which events were detected.
# This was done to reduce the size of the output for those working
# with gridded data.
# Should one want a complete time series, the daily category results
# may simply be left_join() with the detect_event() results
cat_WA_ts <- dplyr::left_join(res_WA$climatology,
                              cat_WA_daily$climatology)
head(cat_WA_ts)




