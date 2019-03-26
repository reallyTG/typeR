library(Momocs)


### Name: drawers
### Title: grindr drawers for shape plots
### Aliases: drawers draw_polygon draw_outline draw_outlines draw_points
###   draw_landmarks draw_lines draw_centroid draw_curve draw_curves
###   draw_firstpoint draw_axes draw_labels draw_links draw_title

### ** Examples

bot[1] %>% paper_grid() %>% draw_polygon()
olea %>% paper_chess %>% draw_lines(~var)

hearts[240] %>% paper_white() %>% draw_outline() %>%
  coo_sample(24) %>% draw_landmarks %>% draw_labels() %>%
  draw_links(links=replicate(2, sample(1:24, 8)))

bot %>%
    paper_grid() %>%
    draw_outlines() %>%
    draw_title("Alcohol abuse \nis dangerous for health", "Drink responsibly")



