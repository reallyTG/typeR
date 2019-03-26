library(AmigaFFH)


### Name: read.SysConfig
### Title: Read an Amiga system-configuration file
### Aliases: read.SysConfig

### ** Examples

## Not run: 
##D ## Put a simple SysConfig object into the tempdir:
##D write.SysConfig(simpleSysConfig(), file.path(tempdir(), "system-configuration"))
##D 
##D ## Now read the same file:
##D sc <- read.SysConfig(file.path(tempdir(), "system-configuration"))
##D 
##D ## and plot it
##D plot(sc)
## End(Not run)



