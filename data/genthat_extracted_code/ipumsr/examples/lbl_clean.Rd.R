library(ipumsr)


### Name: lbl_clean
### Title: Clean unused labels
### Aliases: lbl_clean

### ** Examples

x <- haven::labelled(
  c(1, 2, 3, 1, 2, 3, 1, 2, 3),
  c(Q1 = 1, Q2 = 2, Q3 = 3, Q4= 4)
)

lbl_clean(x)




