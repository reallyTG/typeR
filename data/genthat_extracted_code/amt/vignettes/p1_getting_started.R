## ---- warning=FALSE, message=FALSE---------------------------------------
library(amt)
df1 <- data_frame(x = 1:3, y = 1:3)
is.data.frame(df1)
df1

# Now we can create a track
tr1 <- mk_track(df1, x, y)
is.data.frame(tr1)
tr1


## ------------------------------------------------------------------------
class(tr1)

## ------------------------------------------------------------------------
df1 <- data_frame(x = 1:3, y = 1:3, t = lubridate::ymd("2017-01-01") + lubridate::days(0:2))
tr2 <- mk_track(df1, x, y, t)
class(tr2)

## ------------------------------------------------------------------------
df1 <- data_frame(x = 1:3, y = 1:3, t = lubridate::ymd("2017-01-01") + lubridate::days(0:2), 
                  id = 1, age = 4)

# first we only create a track_xy
tr3 <- mk_track(df1, x, y, id = id, age = age)
tr3

# now lets create a track_xyt
tr4 <- mk_track(df1, x, y, t, id = id, age = age)
tr4

## ------------------------------------------------------------------------
data(sh)
head(sh)

## ------------------------------------------------------------------------
# check if all observations are complete
all(complete.cases(sh)) # no action required

# parse date and time and create time stamps
sh$ts <- as.POSIXct(lubridate::ymd(sh$day) +
                      lubridate::hms(sh$time))

# check for duplicated time stamps
any(duplicated(sh$ts))

# We have some duplicated time stamps, these need to be removed prior to
# creating a track.
sh <- sh[!duplicated(sh$ts), ]

# create new columns
sh$id <- "Animal 1"
sh$month <- lubridate::month(sh$ts)

## ------------------------------------------------------------------------
tr1 <- mk_track(sh, x_epsg31467, y_epsg31467, ts, id = id, month = month)

## ------------------------------------------------------------------------
tr1 <- mk_track(sh, x_epsg31467, y_epsg31467, ts, id = id, month = month, 
                crs = sp::CRS("+init=epsg:31467"))

## ------------------------------------------------------------------------
data(sh)
tr2 <- sh %>% filter(complete.cases(.)) %>% 
  mutate(
    ts = as.POSIXct(lubridate::ymd(day) + lubridate::hms(time)), 
    id = "Animal 1", 
    month = lubridate::month(ts)
  ) %>% 
  filter(!duplicated(ts)) %>% 
  mk_track(x_epsg31467, y_epsg31467, ts, id = id, month = month, 
           crs = sp::CRS("+init=epsg:31467"))
tr2

## ------------------------------------------------------------------------
tr3 <- tr2 %>% filter(month == 5)

# we are left with a track
class(tr3)

## ------------------------------------------------------------------------
transform_coords(tr2, sp::CRS("+init=epsg:4326"))

## ------------------------------------------------------------------------
tr2 <- tr2 %>% mutate(sl_ = step_lengths(.))

## ------------------------------------------------------------------------
summary(tr2$sl_)

## ------------------------------------------------------------------------
summarize_sampling_rate(tr2)

## ------------------------------------------------------------------------
sessionInfo()

