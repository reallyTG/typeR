library(huxtable)


### Name: text_color
### Title: Text color
### Aliases: text_color text_color<- set_text_color map_text_color

### ** Examples


text_color(jams) <-  "blue"
text_color(jams)


set_text_color(jams, "blue")
set_text_color(jams,
      2:3, 1, "blue")
map_text_color(jams,
      by_rows("blue", "red"))



