library(tableHTML)


### Name: make_css_color_rank_theme
### Title: Get css properties for custom color rank theme
### Aliases: make_css_color_rank_theme

### ** Examples


tableHTML <- tableHTML(mtcars)

css <- make_css_color_rank_theme(list(mpg = mtcars$mpg),
                                 c("orange", "yellow","springgreen","royalblue"))

tableHTML %>% add_css_conditional_column(conditional = "color_rank",
                                        color_rank_theme = "Custom",
                                        color_rank_css = css, column = 1)




