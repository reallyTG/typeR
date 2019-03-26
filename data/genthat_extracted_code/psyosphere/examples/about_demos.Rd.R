library(psyosphere)


### Name: about demos
### Title: Explanation how the demo files can be accessed
### Aliases: about_demos

### ** Examples
## No test: 
# Get a list of the demo's
demo(package = "psyosphere")

# Find the location of a demo file
system.file("demo", "smuggler1.R", package = "psyosphere")

# Run demo
demo("smuggler1", package = "psyosphere")

# How to restore progress ------------------------------------------------------

# Set directory (see top of the file)

demo_dir <- tempdir()
dir <- paste0(demo_dir,"/leadership1/")

# Clean environment and load data (see top of each section)
rm(list=setdiff(ls(), "dir"))
load(paste0(dir,"rdata/01.RData"))
## End(No test)


