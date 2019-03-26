library(arsenal)


### Name: comparison.control
### Title: Control settings for 'compare' function
### Aliases: comparison.control

### ** Examples

cntl <- comparison.control(
  tol.num = "pct",     # calculate percent differences
  tol.vars = c("case", # ignore case
               "._",   # set all underscores to dots.
               "e")    # remove all letter e's
)



