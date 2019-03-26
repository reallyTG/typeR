library(crayon)


### Name: make_style
### Title: Create an ANSI color style
### Aliases: make_style

### ** Examples

## Create a style function without creating a style
pink <- make_style("pink")
bgMaroon <- make_style(rgb(0.93, 0.19, 0.65), bg = TRUE)
cat(bgMaroon(pink("I am pink if your terminal wants it, too.\n")))

## Create a new style for pink and maroon background
make_style(pink = "pink")
make_style(bgMaroon = rgb(0.93, 0.19, 0.65), bg = TRUE)
"pink" %in% names(styles())
"bgMaroon" %in% names(styles())
cat(style("I am pink, too!\n", "pink", bg = "bgMaroon"))



