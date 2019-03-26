library(huxtable)


### Name: print_screen
### Title: Print a huxtable on screen
### Aliases: print_screen to_screen to_screen.huxtable

### ** Examples

bottom_border(jams)[1, 1:2] <- 1
bold(jams)[1, 1:2] <- TRUE
jams <- map_text_color(jams,
      by_regex("berry" = "red"))

print_screen(jams)



