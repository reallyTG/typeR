library(openEBGM)


### Name: autoSquash
### Title: Automated data squashing
### Aliases: autoSquash
### Keywords: openEBGM

### ** Examples

data(caers)
proc <- processRaw(caers)
table(proc$N)

squash1 <- autoSquash(proc)
ftable(squash1[, c("N", "weight")])

squash2 <- autoSquash(proc, keep_pts = c(50, 5))
ftable(squash2[, c("N", "weight")])

squash3 <- autoSquash(proc, keep_pts = 100,
                      cut_offs = c(250, 500),
                      num_super_pts = c(20, 60, 125)
)
ftable(squash3[, c("N", "weight")])




