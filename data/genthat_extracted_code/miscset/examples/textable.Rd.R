library(miscset)


### Name: textable
### Title: Table to Latex
### Aliases: textable

### ** Examples

#

## Not run: 
##D d <- head(trees)
##D dc <- 'R "trees" dataset.'
##D textable(d, rownames=TRUE, digits=4, caption=dc)
##D textable(d, '/tmp/trees.tex', caption=dc, as.document=TRUE, 
##D   cmd='pdflatex --output-directory /tmp')
## End(Not run)

#



