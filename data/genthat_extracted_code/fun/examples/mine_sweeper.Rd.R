library(fun)


### Name: mine_sweeper
### Title: Play the Mine Sweeper game in R
### Aliases: mine_sweeper

### ** Examples

## should use Xlib for the x11() device under *nix, e.g
if (interactive()) {
    if (.Platform$OS.type == "windows") 
        x11() else x11(type = "Xlib")
    mine_sweeper()
}



