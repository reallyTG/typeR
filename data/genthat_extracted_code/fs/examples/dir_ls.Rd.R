library(fs)


### Name: dir_ls
### Title: List files
### Aliases: dir_ls dir_map dir_walk dir_info

### ** Examples

## Don't show: 
.old_wd <- setwd(tempdir())
## End(Don't show)
dir_ls(R.home("share"), type = "directory")

# Create a shorter link
link_create(system.file(package = "base"), "base")

dir_ls("base", recursive = TRUE, glob = "*.R")

dir_map("base", identity)

dir_walk("base", str)

dir_info("base")

# Cleanup
link_delete("base")
## Don't show: 
setwd(.old_wd)
## End(Don't show)



