library(plyr)


### Name: progress_win
### Title: Graphical progress bar, powered by Windows.
### Aliases: progress_win

### ** Examples

if(exists("winProgressBar")) {
l_ply(1:100, identity, .progress = "win")
l_ply(1:100, identity, .progress = progress_win(title="Working..."))
}



