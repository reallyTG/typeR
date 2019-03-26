library(mousetrap)


### Name: mt_animate
### Title: Create gif trajectory animation.
### Aliases: mt_animate

### ** Examples

## Not run: 
##D # Preprocess trajectory data
##D mt_example <- mt_align_start(mt_example)
##D mt_example <- mt_remap_symmetric(mt_example) 
##D 
##D # Create animated trajectory gif
##D # (under Linux / OSX)
##D mt_animate(mt_example,filename = "MyMovie.gif")
##D 
##D # Increase duration and density while decreasing speed
##D mt_animate(mt_example, filename = "MyMovie2.gif",
##D   seconds = 10, speed = .3, density = 10)
##D 
##D # Create animated trajectory gif
##D # (under Windows - ImageMagick version specific example)
##D mt_animate(mt_example,filename = "MyMovie.gif",
##D   im_path = "C:/Program Files/ImageMagick-7.0.5-Q16/convert.exe")
##D 
## End(Not run)




