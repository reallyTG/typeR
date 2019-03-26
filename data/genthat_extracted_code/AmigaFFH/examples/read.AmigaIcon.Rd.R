library(AmigaFFH)


### Name: read.AmigaIcon
### Title: Read an Amiga Workbench icon (info) file
### Aliases: read.AmigaIcon

### ** Examples

## Not run: 
##D ## create a simple AmigaIcon:
##D icon <- simpleAmigaIcon()
##D 
##D ## write the icon to the temp dir:
##D write.AmigaIcon(icon, file.path(tempdir(), "icon.info"))
##D 
##D ## read the same file:
##D icon2 <- read.AmigaIcon(file.path(tempdir(), "icon.info"))
## End(Not run)



