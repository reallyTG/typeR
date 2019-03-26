library(otuSummary)


### Name: alphaDiversity
### Title: Calculate the alpha diversity indices
### Aliases: alphaDiversity
### Keywords: summarize

### ** Examples

data(otumothur)

test1 <- alphaDiversity(otutab = otumothur, siteInCol = TRUE,
    taxhead = "taxonomy", threshold = 1, percent = FALSE, write = FALSE)

test2 <- alphaDiversity(otutab = otumothur[,-454], siteInCol = TRUE,
    taxhead = NULL, threshold = 1, percent = FALSE, write = FALSE)



