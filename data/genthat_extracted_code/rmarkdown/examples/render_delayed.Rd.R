library(rmarkdown)


### Name: render_delayed
### Title: Delay Rendering for an Expression
### Aliases: render_delayed

### ** Examples

## Not run: 
##D # Add the following code to an R Markdown document
##D 
##D div(Sys.time())
##D 
##D render_delayed({
##D  Sys.sleep(3)      # simulate an expensive computation
##D  div(Sys.time())
##D })
##D 
##D div(Sys.time())
## End(Not run)



