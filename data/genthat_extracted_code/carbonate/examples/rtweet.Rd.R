library(carbonate)


### Name: .rtweet
### Title: send tweets using carbonate outputs
### Aliases: .rtweet carbon-rtweet

### ** Examples

## Not run: 
##D x <- carbonate::carbon$new()
##D x$carbonate(code = readLines(system.file('DESCRIPTION',package='carbonate')))
##D x$carbonate(code = 'x+2')
##D 
##D # using default status value (x$tweet_status)
##D x$rtweet(system.file('figures/hex_black_small.png',package='carbonate'))
##D 
##D x$rtweet(status = 'these are two pngs',media = x$carbons,media_format='png')
##D x$rtweet(status = 'this is a gif', media = x$carbons,media_format='gif')
##D 
## End(Not run)



