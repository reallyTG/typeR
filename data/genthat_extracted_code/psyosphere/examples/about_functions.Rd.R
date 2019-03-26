library(psyosphere)


### Name: about functions
### Title: psyosphere functions guideline
### Aliases: 'about functions'

### ** Examples

# ------------------------------------------------------------------------------
# Example calculation R file ---------------------------------------------------
# ------------------------------------------------------------------------------

t_distance <- function(
  tracks, bind = TRUE, drop = TRUE, cname = "distances_in_m", t_id = "id"
) {

  # Check variables
  e <- val_psyo(tracks, 0, 0, 0, 2, 2); if (e != "") {stop(e)}
  e <- val_var(bind, "logical"); if (e != "") {stop(e)}
  e <- val_var(drop, "logical"); if (e != "") {stop(e)}
  e <- val_var(cname, "character"); if (e != "") {stop(e)}
  e <- val_cname(tracks, t_id); if (e != "") {stop(e)}

  # Add bearings per track
  result <- apply_tracks(
    tracks,
    "distance_exec_private(eval_track)",
    t_id = t_id
  )

  # Reformat result
  result <- data.frame(result)
  result <- plyr::rename(result, c("result" = cname))

  # Return result
  result <- bind_drop_private(tracks, result, bind, drop)
  return(result)

}

distance_exec_private <- function(tracks) {

  # Get lat and lon from next observation
  current <- subset(tracks, select = c("lon","lat"))
  previous <- apply_shift(
    tracks, "-1", FALSE, c("lon","lat"), t_id = ""
  )

  # Get distances
  distances_in_m <- geosphere::distHaversine(previous, current)

  return(distances_in_m)

}

# ------------------------------------------------------------------------------
# Template for test file -------------------------------------------------------
# ------------------------------------------------------------------------------

# Print title
cat("\nTesting <function_name>()\n")

# Get data
data("psyo_rounds2")
tracks <- psyo_rounds2

# Calculations


# Check results
# if (NROW(________) != ________) { stop("Wrong number of observations") }
# if (NCOL(________) != ________) { stop("Wrong number of variables") }
# val_psyo(________)
# test_sum <- sum(____)
# if (round(test_sum,3) != round(____,3)) {stop("Wrong test_sum")}



