library(plyr)


### Name: create_progress_bar
### Title: Create progress bar.
### Aliases: create_progress_bar
### Keywords: utilities

### ** Examples

# No progress bar
l_ply(1:100, identity, .progress = "none")
## Not run: 
##D # Use the Tcl/Tk interface
##D l_ply(1:100, identity, .progress = "tk")
## End(Not run)
# Text-based progress (|======|)
l_ply(1:100, identity, .progress = "text")
# Choose a progress character, run a length of time you can see
l_ply(1:10000, identity, .progress = progress_text(char = "."))



