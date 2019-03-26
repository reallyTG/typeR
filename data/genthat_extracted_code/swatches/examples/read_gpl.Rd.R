library(swatches)


### Name: read_gpl
### Title: Read colors from GIMP Palette (GPL) files
### Aliases: read_gpl

### ** Examples

# built-in palette
gimp16 <- read_gpl(system.file("palettes", "base16.gpl", package="swatches"))
print(gimp16)
show_palette(gimp16)

# from the internet directly
## Not run: 
##D bright <- read_gpl(URL)
##D print(bright)
##D show_palette(bright)
## End(Not run)



