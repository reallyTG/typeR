library(nparACT)


### Name: nparACT_base_loop
### Title: Classic Nonparametric Actigraphy Measures for Multiple
###   Actigraphy Files
### Aliases: nparACT_base_loop

### ** Examples

# example function nparACT_loop
data(sleepstudy)
name <- "sleepstudy_example"
newdir <- file.path(tempdir(),name)
dir.create(newdir, showWarnings = FALSE)
olddir <- setwd(newdir)
write.table(sleepstudy, file = "sleepstudy.txt", row.names=FALSE, col.names = FALSE)
r <- nparACT_base_loop(newdir, SR = 4/60)
setwd(olddir)



