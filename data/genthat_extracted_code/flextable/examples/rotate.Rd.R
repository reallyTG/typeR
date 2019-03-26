library(flextable)


### Name: rotate
### Title: rotate cell text
### Aliases: rotate

### ** Examples

ft <- flextable(head(iris))
ft <- rotate(ft, rotation = "tbrl", part = "header", align = "center")
ft <- align(ft, align = "center")
ft <- autofit(ft)
ft <- height(ft, height = max(dim_pretty(ft, part = "header")$widths), part = "header")



