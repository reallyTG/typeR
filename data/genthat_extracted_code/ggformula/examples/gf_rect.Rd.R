library(ggformula)


### Name: gf_rect
### Title: Formula interface to geom_rect()
### Aliases: gf_rect

### ** Examples

gf_rect( 1 + 2 ~ 3 + 4, alpha = 0.3, color = "red")
# use data = data.frame() so we get 1 rectangle and not 1 per row of faithful
# use inherit = FALSE because we are not reusing eruptions and waiting
gf_point(eruptions ~ waiting, data = faithful) %>%
  gf_rect(1.5 + 3 ~ 45 + 68, fill = "red", alpha = 0.2,
          data = data.frame(), inherit = FALSE) %>%
  gf_rect(3 + 5.5 ~ 68 + 100, fill = "green", alpha = 0.2,
          data = data.frame(), inherit = FALSE)



