library(tabulizer)


### Name: locate_areas
### Title: extract_areas
### Aliases: locate_areas extract_areas

### ** Examples

## No test: 
# simple demo file
f <- system.file("examples", "data.pdf", package = "tabulizer")

# locate areas only, using Shiny app
locate_areas(f)

# locate areas only, using native graphics device
locate_areas(f, widget = "shiny")

# locate areas and extract
extract_areas(f)
## End(No test)



