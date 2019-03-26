## ----setup, include = FALSE----------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- eval=FALSE, install------------------------------------------------
#  install.packages("tuber")

## ---- eval=FALSE, install_g----------------------------------------------
#  # install.packages('devtools')
#  devtools::install_github("soodoku/tuber", build_vignettes = TRUE)

## ---- eval=FALSE, loadlib------------------------------------------------
#  library(tuber)

## ---- eval=FALSE, auth---------------------------------------------------
#  yt_oauth("998136489867-5t3tq1g7hbovoj46dreqd6k5kd35ctjn.apps.googleusercontent.com", "MbOSt6cQhhFkwETXKur-L9rN")

## ---- eval=FALSE, prints-------------------------------------------------
#  ## Waiting for authentication in browser...
#  ## Press Esc/Ctrl + C to abort
#  ## Authentication complete.

## ---- eval=FALSE, getstats-----------------------------------------------
#  get_stats(video_id="N708P-A45D0")

## ---- eval=FALSE, getdetails---------------------------------------------
#  get_video_details(video_id="N708P-A45D0")

## ---- eval=FALSE, getcaptions--------------------------------------------
#  get_captions(video_id="yJXTXN4xrI8")

## ---- eval=FALSE, searchvids---------------------------------------------
#  res <- yt_search("Barack Obama")
#  head(res[, 1:3])

## ---- eval=FALSE, get_comments-------------------------------------------
#  res <- get_comment_threads(c(video_id="N708P-A45D0"))
#  head(res)

## ---- eval=FALSE, get_channel_vids_stats---------------------------------
#  
#  a <- list_channel_resources(filter = c(channel_id = "UCT5Cx1l4IS3wHkJXNyuj4TA"), part="contentDetails")
#  
#  # Uploaded playlists:
#  playlist_id <- a$items[[1]]$contentDetails$relatedPlaylists$uploads
#  
#  # Get videos on the playlist
#  vids <- get_playlist_items(filter= c(playlist_id=playlist_id))
#  
#  # Video ids
#  vid_ids <- as.vector(vids$contentDetails.videoId)
#  
#  # Function to scrape stats for all vids
#  get_all_stats <- function(id) {
#    get_stats(id)
#  }
#  
#  # Get stats and convert results to data frame
#  res <- lapply(vid_ids, get_all_stats)
#  res_df <- do.call(rbind, lapply(res, data.frame))
#  
#  head(res_df)

