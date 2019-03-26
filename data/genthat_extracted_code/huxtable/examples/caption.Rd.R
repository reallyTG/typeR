library(huxtable)


### Name: caption
### Title: Caption
### Aliases: caption caption<- set_caption

### ** Examples


caption(jams) <-  "An example table"
caption(jams)
jams

# escape caption characters:
caption(jams) <- sanitize(
      "Make $$$ with jam",
      type = "latex")



