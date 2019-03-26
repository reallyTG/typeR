library(ipumsr)


### Name: lbl_add
### Title: Add labels for unlabelled values
### Aliases: lbl_add lbl_add_vals

### ** Examples

x <- haven::labelled(
  c(100, 200, 105, 990, 999, 230),
  c(`Unknown` = 990, NIU = 999)
)

lbl_add(x, lbl(100, "$100"), lbl(105, "$105"), lbl(200, "$200"), lbl(230, "$230"))

lbl_add_vals(x)
lbl_add_vals(x, ~paste0("$", .))
lbl_add_vals(x, vals = c(100, 200))




