library(fs)


### Name: file_info
### Title: Query file metadata
### Aliases: file_info

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
write.csv(mtcars, "mtcars.csv")
file_info("mtcars.csv")

# Files in the working directory modified more than 20 days ago
files <- file_info(dir_ls())
files$path[difftime(Sys.time(), files$modification_time, units = "days") > 20]

# Cleanup
file_delete("mtcars.csv")
## Don't show: 
setwd(.old_wd)
## End(Don't show)



