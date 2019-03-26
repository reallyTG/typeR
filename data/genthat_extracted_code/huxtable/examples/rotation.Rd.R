library(huxtable)


### Name: rotation
### Title: Text rotation
### Aliases: rotation rotation<- set_rotation map_rotation

### ** Examples


rotation(jams) <-  90
rotation(jams)


jams2 <- set_rotation(jams,
      90)
rotation(jams2)

jams3 <- set_rotation(jams,
      2:3, 1, 90)
rotation(jams3)

jams4 <- map_rotation(jams,
      by_rows(
        90,
        270)
      )
rotation(jams4)



