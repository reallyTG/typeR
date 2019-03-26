library(questionr)


### Name: tabs
### Title: Weighted Crossresult
### Aliases: tabs

### ** Examples

data(hdv2003) 
tabs(hdv2003, x = "relig", y = c("qualif", "trav.imp"), weight = "poids")
result <- tabs(hdv2003, x = "relig", y = c("qualif", "trav.imp"), type = "counts")
format(result, digits = 3)
# library(knitr)
# xt <- tabs(hdv2003, x = "relig", y = c("qualif", "trav.imp"), weight = "poids")
# kable(format(xt))                        # to use with RMarkdown...




