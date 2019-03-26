library(huxtable)


### Name: left_padding
### Title: Cell padding
### Aliases: left_padding left_padding<- set_left_padding map_left_padding
###   right_padding top_padding bottom_padding right_padding<-
###   top_padding<- bottom_padding<- set_right_padding set_top_padding
###   set_bottom_padding map_right_padding map_top_padding
###   map_bottom_padding

### ** Examples


left_padding(jams) <-  20
left_padding(jams)


jams2 <- set_left_padding(jams,
      20)
left_padding(jams2)

jams3 <- set_left_padding(jams,
      2:3, 1, 20)
left_padding(jams3)

jams4 <- map_left_padding(jams,
      by_rows(
        20,
        10)
      )
left_padding(jams4)



