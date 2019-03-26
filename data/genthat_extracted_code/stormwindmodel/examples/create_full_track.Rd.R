library(stormwindmodel)


### Name: create_full_track
### Title: Impute hurricane tracks to finer time scale
### Aliases: create_full_track

### ** Examples

data("floyd_tracks")
full_track <- create_full_track(hurr_track = floyd_tracks)

# Interpolate to every half hour (instead of default 15 minutes)
full_track <- create_full_track(hurr_track = floyd_tracks, tint = 0.5)




