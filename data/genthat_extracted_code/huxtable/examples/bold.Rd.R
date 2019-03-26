library(huxtable)


### Name: bold
### Title: Cell text style
### Aliases: bold bold<- set_bold map_bold italic italic<- set_italic
###   map_italic

### ** Examples


bold(jams) <-  TRUE
bold(jams)


set_bold(jams, TRUE)
set_bold(jams,
      2:3, 1, TRUE)
map_bold(jams,
      by_rows(TRUE, FALSE))



