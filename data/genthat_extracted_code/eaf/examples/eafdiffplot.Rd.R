library(eaf)


### Name: eafdiffplot
### Title: Empirical attainment function differences
### Aliases: eafdiffplot
### Keywords: graphs

### ** Examples

A1 <- read.data.sets(file.path(system.file(package="eaf"), "extdata", "ALG_1_dat"))
A2 <- read.data.sets(file.path(system.file(package="eaf"), "extdata", "ALG_2_dat"))
## No test: 
# These take time
eafdiffplot(A1, A2, full.eaf = TRUE)
eafdiffplot(A1, A2, type = "area")
eafdiffplot(A1, A2, type = "point")
## End(No test)
# A more complex example
a1 <- read.data.sets(file.path(system.file(package="eaf"), "extdata", "wrots_l100w10_dat"))
a2 <- read.data.sets(file.path(system.file(package="eaf"), "extdata", "wrots_l10w100_dat"))
DIFF <- eafdiffplot(a1, a2, col = c("white", "blue", "red"), intervals = 5,
type = "point",
            title.left = expression("W-RoTS, " * lambda * "=" * 100 * ", " * omega * "=" * 10),
            title.right= expression("W-RoTS, " * lambda * "=" * 10 *
", " * omega * "=" * 100),
            right.panel.last={ abline(a = 0, b = 1, col = "red", lty = "dashed")})
DIFF$right[,3] <- -DIFF$right[,3]

## Save the values to a file.
# write.table(rbind(DIFF$left,DIFF$right),
#             file = "wrots_l100w10_dat-wrots_l10w100_dat-diff.txt",
#             quote = FALSE, row.names = FALSE, col.names = FALSE)




