library(diffobj)


### Name: PaletteOfStyles-class
### Title: Class for Tracking Default Styles by Style Type
### Aliases: PaletteOfStyles-class PaletteOfStyles

### ** Examples

## Not run: 
##D ## Look at all "ansi256" styles (assumes compatible terminal)
##D PaletteOfStyles()["ansi256",,]
## End(Not run)
## Generate the default style object palette, and replace
## the ansi256 / light / rgb style with our modified one
## which for illustrative purposes is the raw style
my.pal <- PaletteOfStyles()
my.style <- StyleRaw()   # See `?Style` for custom styles
my.style@funs@word.delete <- function(x) sprintf("--%s--", x)
my.pal["ansi256", "light", "rgb"] <- list(my.style) # note `list()`
## Output has no format now for format/color.mode/brightness
## we modified ...
## `pager="off"` for CRAN compliance; you may omit in normal use
diffPrint(
   1:3, 2:5, format="ansi256", color.mode="rgb", brightness="light",
   palette.of.styles=my.pal, pager="off", disp.width=80
)
## If so desired, set our new style palette as the default
## one; could also pass directly as argument to `diff*` funs
## Not run: 
##D options(diffobj.palette=defs)
## End(Not run)



