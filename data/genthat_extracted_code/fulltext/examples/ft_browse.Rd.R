library(fulltext)


### Name: ft_browse
### Title: Browse an article in your default browser
### Aliases: ft_browse

### ** Examples

## Not run: 
##D x <- ft_get('10.7554/eLife.04300', from='elife')
##D ft_browse(x)
##D ft_browse(x, browse=FALSE)
##D 
##D ft_browse( ft_get('10.3389/fphar.2014.00109', from="entrez") )
##D 
##D # open to publisher site
##D ft_browse(x, "publisher")
## End(Not run)



