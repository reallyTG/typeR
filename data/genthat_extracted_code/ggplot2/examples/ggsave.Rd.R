library(ggplot2)


### Name: ggsave
### Title: Save a ggplot (or other grid object) with sensible defaults
### Aliases: ggsave

### ** Examples

## Not run: 
##D ggplot(mtcars, aes(mpg, wt)) + geom_point()
##D 
##D ggsave("mtcars.pdf")
##D ggsave("mtcars.png")
##D 
##D ggsave("mtcars.pdf", width = 4, height = 4)
##D ggsave("mtcars.pdf", width = 20, height = 20, units = "cm")
##D 
##D # delete files with base::unlink()
##D unlink("mtcars.pdf")
##D unlink("mtcars.png")
##D 
##D # specify device when saving to a file with unknown extension
##D # (for example a server supplied temporary file)
##D file <- tempfile()
##D ggsave(file, device = "pdf")
##D unlink(file)
## End(Not run)



