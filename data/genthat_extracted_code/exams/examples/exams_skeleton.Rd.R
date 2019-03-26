library(exams)


### Name: exams_skeleton
### Title: Generate Skeleton for Exams Directory/Script
### Aliases: exams_skeleton exams.skeleton
### Keywords: utilities

### ** Examples

## output directory (replace this with "/path/to/your/directory")
mydir <- file.path(tempdir(), "myexam")

## create exams skeleton with absolute paths in demo.R
exams_skeleton(dir = mydir, absolute = TRUE)

## look at created files
dir(mydir)
dir(mydir, recursive = TRUE)

## now open demo-all.R or any of the other demo-*.R scripts in your
## favorite R code editor and run the examples...



