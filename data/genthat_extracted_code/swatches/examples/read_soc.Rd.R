library(swatches)


### Name: read_soc
### Title: Read colors from OpenOffice Palette (SOC) files
### Aliases: read_soc

### ** Examples

# built-in palette
soc_file <- system.file("palettes", "ccooo.soc", package="swatches")
system(sprintf("cat %s", soc_file))
ccooo <- read_soc(soc_file)
print(ccooo)
show_palette(ccooo)

# from the internet directly
## Not run: 
##D galaxy <- read_soc("https://www.openoffice.org/ui/VisualDesign/docs/colors/galaxy.soc")
##D print(galaxy)
##D show_palette(galaxy)
## End(Not run)



