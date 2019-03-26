library(knitr)


### Name: hook_pdfcrop
### Title: Built-in chunk hooks to extend knitr
### Aliases: hook_pdfcrop hook_optipng hook_pngquant hook_plot_custom
###   hook_purl

### ** Examples

if (require("rgl") && exists("hook_rgl")) knit_hooks$set(rgl = hook_rgl)
# then in code chunks, use the option rgl=TRUE



