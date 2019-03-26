library(plyr)


### Name: progress_text
### Title: Text progress bar.
### Aliases: progress_text

### ** Examples

l_ply(1:100, identity, .progress = "text")
l_ply(1:100, identity, .progress = progress_text(char = "-"))



