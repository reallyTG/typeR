library(showtext)


### Name: showtext_opts
### Title: Setting Options for 'showtext' package
### Aliases: showtext_opts showtext.opts

### ** Examples

## Not run: 
##D ## Set dpi to 200
##D op = showtext_opts(dpi = 200)
##D 
##D png("dpi_200.png", 800, 800, res = 200)
##D par(family = "sans")
##D showtext_begin()
##D 
##D set.seed(123)
##D plot(density(rnorm(100)))
##D 
##D showtext_end()
##D dev.off()
##D 
##D ## Restore old options
##D showtext_opts(op)
##D 
##D png("dpi_96.png", 800, 800, res = 96)
##D par(family = "sans")
##D showtext_begin()
##D 
##D set.seed(123)
##D plot(density(rnorm(100)))
##D 
##D showtext_end()
##D dev.off()
## End(Not run)



