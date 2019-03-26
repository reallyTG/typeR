library(swatches)


### Name: read_ase
### Title: Read colors from Adobe Swatch Exchange (ASE) files
### Aliases: read_ase

### ** Examples

# built-in palette
keep_the_change <- read_ase(system.file("palettes", "keep_the_change.ase", package="swatches"))
print(keep_the_change)
show_palette(keep_the_change)

# from the internet directly
## Not run: 
##D github <- "https://github.com/picwellwisher12pk/en_us/raw/master/Swatches/Metal.ase"
##D metal <- read_ase(github)
##D print(metal)
##D show_palette(metal)
## End(Not run)



