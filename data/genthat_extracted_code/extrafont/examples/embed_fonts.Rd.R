library(extrafont)


### Name: embed_fonts
### Title: Embeds fonts that are listed in the local Fontmap
### Aliases: embed_fonts

### ** Examples

## Not run: 
##D loadfonts()
##D pdf('fonttest.pdf')
##D library(ggplot2)
##D 
##D p <- ggplot(mtcars, aes(x=wt, y=mpg)) + geom_point()
##D 
##D # Run only the code below that is appropriate for your system
##D # On Mac and Windows, Impact should be available
##D p + opts(axis.title.x=theme_text(size=16, family="Impact", colour="red"))
##D 
##D # On Linux, Purisa may be available
##D p + opts(axis.title.x=theme_text(size=16, family="Purisa", colour="red"))
##D dev.off()
##D 
##D embed_fonts('fonttest.pdf', outfile='fonttest-embed.pdf')
## End(Not run)



