library(pacman)


### Name: p_information
### Title: Package Information
### Aliases: p_information p_info
### Keywords: info information package packageDescription

### ** Examples

p_information()
p_info()
names(p_info())
p_info()[names(p_info())]
p_info(pacman)
p_info(pacman, Author)
p_info(pacman, BugReports, URL)
p_info(pacman, fields = "Version")
## Not run: 
##D p_extract(p_info(ggplot2, "Depends"))
##D p_extract(p_info(ggplot2, "Imports"))
##D lapply(p_info(ggplot2, "Imports", "Depends", "Suggests"), p_extract)
## End(Not run)



