library(Hmisc)


### Name: html
### Title: Convert an S object to HTML
### Aliases: html html.latex html.data.frame html.default htmlVerbatim
### Keywords: utilities interface methods file character manip

### ** Examples

## Not run: 
##D x <- matrix(1:6, nrow=2, dimnames=list(c('a','b'),c('c','d','e')))
##D w <- latex(x)
##D h <- html(w) # run HeVeA to convert .tex to .html
##D h <- html(x) # convert x directly to html
##D w <- html(x, link=c('','B'))   # hyperlink first row first col to B
##D 
##D # Assuming system package tex4ht is installed, easily convert advanced
##D # LaTeX tables to html
##D getHdata(pbc)
##D s <- summaryM(bili + albumin + stage + protime + sex + age + spiders ~ drug,
##D               data=pbc, test=TRUE)
##D w <- latex(s, npct='slash', file='s.tex')
##D z <- html(w)
##D browseURL(z$file)
##D 
##D d <- describe(pbc)
##D w <- latex(d, file='d.tex')
##D z <- html(w)
##D browseURL(z$file)
## End(Not run)



