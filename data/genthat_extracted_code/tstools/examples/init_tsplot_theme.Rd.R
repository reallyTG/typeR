library(tstools)


### Name: init_tsplot_theme
### Title: Initiate Default Theme
### Aliases: init_tsplot_theme init_tsplot_print_theme

### ** Examples

# create a list
data(KOF)
tt <- init_tsplot_theme()
# adjust a single element
tt$highlight_window <- TRUE
# pass the list to tsplot
tsplot(KOF$kofbarometer,theme = tt)
# for more theme examples check the vignette
vignette("tstools")





