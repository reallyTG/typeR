library(huxtable)


### Name: font_size
### Title: Font size
### Aliases: font_size font_size<- set_font_size map_font_size

### ** Examples


font_size(jams) <-  14
font_size(jams)


jams2 <- set_font_size(jams,
      14)
font_size(jams2)

jams3 <- set_font_size(jams,
      2:3, 1, 14)
font_size(jams3)

jams4 <- map_font_size(jams,
      by_rows(
        14,
        12)
      )
font_size(jams4)



