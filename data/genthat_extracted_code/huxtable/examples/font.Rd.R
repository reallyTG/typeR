library(huxtable)


### Name: font
### Title: Font
### Aliases: font font<- set_font map_font

### ** Examples


font(jams) <-  "times"
font(jams)


jams2 <- set_font(jams,
      "times")
font(jams2)

jams3 <- set_font(jams,
      2:3, 1, "times")
font(jams3)

jams4 <- map_font(jams,
      by_rows(
        "times",
        "arial")
      )
font(jams4)



