library(huxtable)


### Name: valign
### Title: Vertical alignment
### Aliases: valign valign<- set_valign map_valign

### ** Examples


valign(jams) <-  "bottom"
valign(jams)


jams2 <- set_valign(jams,
      "bottom")
valign(jams2)

jams3 <- set_valign(jams,
      2:3, 1, "bottom")
valign(jams3)

jams4 <- map_valign(jams,
      by_rows(
        "bottom",
        "bottom")
      )
valign(jams4)



