library(fun)


### Name: lights_out
### Title: Play the "Lights Out" game in R
### Aliases: lights_out

### ** Examples

## should use Xlib for the x11() device under *nix, e.g
if (interactive()) {
    if (.Platform$OS.type == "windows") 
        x11() else x11(type = "Xlib")
    lights_out()
}



