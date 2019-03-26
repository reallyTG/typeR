library(swatches)


### Name: read_aco
### Title: Read colors from Adobe Color (ACO) files
### Aliases: read_aco

### ** Examples

# built-in palette
eighties <- read_aco(system.file("palettes", "tomorrow_night_eighties.aco", package="swatches"))
print(eighties)
show_palette(eighties)

# from the internet directly
## Not run: 
##D tomorrow_night <- read_aco("https://bit.ly/tomorrow-night-aco")
##D print(tomorrow_night)
##D show_palette(tomorrow_night)
## End(Not run)



