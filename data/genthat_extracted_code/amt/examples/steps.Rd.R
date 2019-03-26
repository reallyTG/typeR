library(amt)


### Name: steps
### Title: Functions to create and work with steps
### Aliases: steps direction_abs direction_abs.track_xy direction_rel
###   direction_rel.track_xy step_lengths step_lengths.track_xy
###   steps_by_burst steps_by_burst.track_xyt steps steps.track_xy
###   steps.track_xyt

### ** Examples



# Absolute directions

xy <- data_frame(
  x = c(1, 4, 8, 8, 12, 8, 0, 0, 4, 2),
  y = c(0, 0, 0, 8, 12, 12, 12, 8, 4, 2))
trk <- mk_track(xy, x, y)

# append last
direction_abs(trk, append_last = TRUE)
direction_abs(trk, append_last = FALSE)

# degrees
direction_abs(trk, degrees = FALSE)
direction_abs(trk, degrees = TRUE)

# full circle or not
direction_abs(trk, degrees = TRUE, full_circle = TRUE)
direction_abs(trk, degrees = TRUE, full_circle = FALSE)

# direction of 0
direction_abs(trk, full_circle = TRUE, zero_dir = "N")
direction_abs(trk, full_circle = TRUE, zero_dir = "E")
direction_abs(trk, full_circle = TRUE, zero_dir = "S")
direction_abs(trk, full_circle = TRUE, zero_dir = "W")

# clockwise or not
direction_abs(trk, full_circle = TRUE, zero_dir = "N", clockwise = FALSE)
direction_abs(trk, full_circle = TRUE, zero_dir = "N", clockwise = TRUE)

# Bearing (i.e. azimuth): only for lon/lat
direction_abs(trk, full_circle = FALSE, zero_dir = "N", lonlat = FALSE, clockwise = TRUE)
direction_abs(trk, full_circle = FALSE, zero_dir = "N", lonlat = TRUE, clockwise = TRUE)

# How do results compare to other packages
# adehabitatLT
df <- adehabitatLT::as.ltraj(data.frame(x = xy$x, y = xy$y), typeII = FALSE, id = 1)
df[[1]]$abs.angle
amt::direction_abs(trk, degrees = FALSE, full_circle = FALSE)

# bcpa
df <- bcpa::MakeTrack(xy$x, xy$y, lubridate::now() +  lubridate::hours(1:10))
bcpa::GetVT(df)$Phi
direction_abs(trk, degrees = FALSE, full_circle = FALSE, append_last = FALSE)

# move
m <- move::move(xy$x, xy$y, lubridate::now() + lubridate::hours(1:10),
 proj = sp::CRS("+init=epsg:4326"))
move::angle(m)
direction_abs(trk, degrees = TRUE, full_circle = FALSE, zero_dir = "N",
  clockwise = TRUE, append_na = FALSE, lonlat = TRUE)

# trajectories
t1 <- trajectories::Track(
  spacetime::STIDF(sp::SpatialPoints(cbind(xy$x, xy$y)),
  lubridate::now(tzone = "UTC") + lubridate::hours(1:10), data = data.frame(1:10)))

t1[["direction"]]
direction_abs(trk, degrees = TRUE, full_circle = TRUE, zero_dir = "N",
  clockwise = TRUE, append_last = FALSE)

# moveHMM (only rel. ta)
df <- data.frame(ID = 1, x = xy$x, y = xy$y)
moveHMM::prepData(df, type = "UTM")
# How do results compare to other packages
xy <- data_frame(
  x = c(1, 4, 8, 8, 12, 8, 0, 0, 4, 2),
  y = c(0, 0, 0, 8, 12, 12, 12, 8, 4, 2))
trk <- mk_track(xy, x, y)
# adehabitatLT
df <- adehabitatLT::as.ltraj(data.frame(x = xy$x, y = xy$y), typeII = FALSE, id = 1)
df[[1]]$rel.angle
amt::direction_rel(trk, degrees = FALSE, full_circle = FALSE)

# trajectories
t1 <- trajectories::Track(
  spacetime::STIDF(sp::SpatialPoints(cbind(xy$x, xy$y)),
  lubridate::now() + lubridate::hours(1:10), data = data.frame(1:10)))

t1[["direction"]]
direction_abs(trk, degrees = TRUE, full_circle = TRUE, zero_dir = "N",
  clockwise = TRUE, append_last = FALSE)

# moveHMM (only rel. ta)
df <- data.frame(ID = 1, x = xy$x, y = xy$y)
moveHMM::prepData(df, type = "UTM")

trk

# step_lengths ------------------------------------------------------------
xy <- data_frame(
  x = c(0, 1, 2),
  y = c(0, 1, 2)
)
xy <- mk_track(xy, x, y)

step_lengths(xy, lonlat = FALSE)
step_lengths(xy, lonlat = TRUE) # in m, but coords are assumed in degrees


# creating steps ----------------------------------------------------------

# Create some dummy data
library(lubridate)
df <- data_frame(
  x = runif(10),
  y = runif(10),
  a = runif(10),
  t = now() + hours(c(1:2, 5:6, 9:10, 14:17)),
  b = 3,
  c = a + 30
)

library(amt)
make_track(df, x, y, t, a, b, c) %>% steps(keep_cols = "start")

make_track(df, x, y, a = a, b = b, c = c) %>% steps(keep_cols = "end")

make_track(df, x, y, t, a, b, c) %>%
  track_resample(rate = hours(1), tolerance = minutes(5)) %>%
  steps_by_burst(keep_cols = "start")

make_track(df, x, y, t, a, b, c) %>%
  track_resample(rate = hours(1), tolerance = minutes(5)) %>%
  steps_by_burst(keep_cols = NULL)




