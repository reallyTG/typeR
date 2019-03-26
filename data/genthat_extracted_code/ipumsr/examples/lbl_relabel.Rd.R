library(ipumsr)


### Name: lbl_relabel
### Title: Relabel labelled values
### Aliases: lbl_relabel

### ** Examples

x <- haven::labelled(
  c(10, 10, 11, 20, 30, 99, 30, 10),
  c(Yes = 10, `Yes - Logically Assigned` = 11, No = 20, Maybe = 30, NIU = 99)
)

lbl_relabel(
  x,
  lbl(10, "Yes/Yes-ish") ~ .val %in% c(10, 11),
  lbl(90, "???") ~ .val == 99 | .lbl == "Maybe"
)

# If relabelling to labels that already exist, don't need to specify both label
# and value:
# If just bare, assumes it is a value:
lbl_relabel(x, 10 ~ .val == 11)
# Use single argument to lbl for the label
lbl_relabel(x, lbl("Yes") ~ .val == 11)
# Or can used named arguments
lbl_relabel(x, lbl(.val = 10) ~ .val == 11)




