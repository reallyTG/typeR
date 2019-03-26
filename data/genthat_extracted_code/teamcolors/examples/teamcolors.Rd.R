library(teamcolors)


### Name: teamcolors
### Title: Color palettes for professional sports teams
### Aliases: teamcolors
### Keywords: datasets

### ** Examples

data(teamcolors)

if (require(Lahman) & require(dplyr)) {
  pythag <- Teams %>%
    filter(yearID == 2014) %>%
    select(name, W, L, R, RA) %>%
    mutate(wpct = W / (W+L), exp_wpct = 1 / (1 + (RA/R)^2)) %>%
    # St. Louis Cardinals do not match
    left_join(teamcolors, by = "name")
  with(pythag, plot(exp_wpct, wpct, bg = primary, col = secondary, pch = 21, cex = 3))


# Using ggplot2
if (require(ggplot2)) {
  ggplot(pythag, aes(x = wpct, y = exp_wpct, color = name, fill = name)) + 
    geom_abline(slope = 1, intercept = 0, linetype = 3) + 
    geom_point(shape = 21, size = 3) + 
    scale_fill_manual(values = pythag$primary, guide = FALSE) + 
    scale_color_manual(values = pythag$secondary, guide = FALSE) + 
    geom_text(aes(label = substr(name, 1, 3))) + 
    scale_x_continuous("Winning Percentage", limits = c(0.3, 0.7)) + 
    scale_y_continuous("Expected Winning Percentage", limits = c(0.3, 0.7)) + 
    coord_equal()
  }
}




