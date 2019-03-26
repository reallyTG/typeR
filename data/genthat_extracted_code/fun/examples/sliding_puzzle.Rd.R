library(fun)


### Name: sliding_puzzle
### Title: Sliding puzzle in R
### Aliases: sliding_puzzle

### ** Examples

## should use Xlib for the x11() device under *nix, e.g
if (interactive()) {
    if (.Platform$OS.type == "windows") 
        x11() else x11(type = "Xlib")
    sliding_puzzle()
    sliding_puzzle(z = matrix(0:11, 3, 4))
}



