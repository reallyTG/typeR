library(knitr)


### Name: knit_theme
### Title: Syntax highlighting themes
### Aliases: knit_theme
### Keywords: datasets

### ** Examples

opts_knit$set(out.format = "latex")
knit_theme$set("edit-vim")

knit_theme$get()  # names of all available themes

thm = knit_theme$get("acid")  # parse the theme to a list
knit_theme$set(thm)

opts_knit$set(out.format = NULL)  # restore option



