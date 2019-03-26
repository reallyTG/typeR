library(psyosphere)


### Name: apply_tracks
### Title: Run function on each track in a psyo data frame
### Aliases: apply_tracks

### ** Examples

# Working examples -------------------------------------------------------------

# Test function for examples
test_sum <- function(track, more = 0) {
  track$lon_sum <- sum(track$lon) + more
  return(track)
}

# Simple example
data(psyo)
psyo <- apply_tracks(
  psyo,"test_sum(eval_track)"
)

# See all data as one track
data(psyo)
psyo <- apply_tracks(
  psyo,"test_sum(eval_track)", t_id =""
)

# Use of arguments
data(psyo)
psyo <- apply_tracks(
  psyo,"test_sum(eval_track, arg1)", arg1 = 5
)

# What not to do ---------------------------------------------------------------

# Only return the changed "eval_track" as result. The following examples show
# what can go wrong otherwise.

test_wrong <- function(selected_track, all_tracks) {
  all_tracks$sum <- all_tracks$lon + all_tracks$lat
  return(all_tracks)
}

data(psyo)
psyo <- psyo[psyo[,c("p_id")]== 0,]

psyo <- apply_tracks(
  psyo,"test_wrong(eval_track, arg1)", arg1 = psyo
)




