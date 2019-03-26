library(nparACT)


### Name: nparACT_flex_loop
### Title: Extended Nonparametric Actigraphy Measures for Multiple
###   Actigraphy Files
### Aliases: nparACT_flex_loop

### ** Examples

# example function nparACT_flex_loop
data(sleepstudy)
name <- "sleepstudy_example"
newdir <- file.path(tempdir(),name)
dir.create(newdir, showWarnings = FALSE)
olddir <- setwd(newdir)
write.table(sleepstudy, file = "sleepstudy.txt", row.names=FALSE, col.names = FALSE)
r <- nparACT_flex_loop(newdir, SR = 4/60, minutes = 435)
setwd(olddir)



