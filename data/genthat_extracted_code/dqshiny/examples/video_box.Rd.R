library(dqshiny)


### Name: video_box
### Title: Adds a video box to the app
### Aliases: video_box video_tag

### ** Examples

## Only run examples in interactive R sessions
if (interactive()) {

library(shiny)
base_url <- "http://download.blender.org/peach/bigbuckbunny_movies/"
shinyApp(
  ui = fluidPage(
    video_box("lowRes",
      paste0(base_url, "BigBuckBunny_320x180.mp4"),
      "Low Resolution"
    ),
    video_box("highRes", type = "audio/ogg",
      paste0(base_url, "big_buck_bunny_720p_stereo.ogg")
    ),
    fluidRow(column(12,
      "Low resolution: ", video_tag("lowRes"), br(),
      "Higher resolution: ", video_tag("highRes", 300, "Bookmark at 5min")
    ))
  ),
  server = function(input, output) {}
)

}



