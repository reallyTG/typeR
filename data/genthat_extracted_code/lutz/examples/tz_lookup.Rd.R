library(lutz)


### Name: tz_lookup
### Title: Lookup time zones of sf or sp points
### Aliases: tz_lookup

### ** Examples

if (require("sf")) {

state_pts <- lapply(seq_along(state.center$x), function(i) {
  st_point(c(state.center$x[i], state.center$y[i]))
})

state_centers_sf <- st_sf(st_sfc(state_pts))

state_centers_sf$tz <- tz_lookup(state_centers_sf)

plot(state_centers_sf[, "tz"])
}




