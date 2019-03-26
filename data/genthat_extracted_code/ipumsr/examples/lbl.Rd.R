library(ipumsr)


### Name: lbl
### Title: Make a label placeholder object
### Aliases: lbl

### ** Examples

x <- haven::labelled(
  c(100, 200, 105, 990, 999, 230),
  c(`Unknown` = 990, NIU = 999)
)

lbl_add(x, lbl(100, "$100"), lbl(105, "$105"), lbl(200, "$200"), lbl(230, "$230"))




