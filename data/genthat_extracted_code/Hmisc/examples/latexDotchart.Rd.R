library(Hmisc)


### Name: latexDotchart
### Title: Enhanced Dot Chart for LaTeX Picture Environment with epic
### Aliases: latexDotchart
### Keywords: hplot

### ** Examples

## Not run: 
##D z <- latexDotchart(c(.1,.2), c('a','bbAAb'), xlab='This Label',
##D                    auxdata=c(.1,.2), auxtitle='Zcriteria')
##D f <- '/tmp/t.tex'
##D cat('\documentclass{article}\n\usepackage{epic,color}\n\begin{document}\n', file=f)
##D cat(z, sep='\n', file=f, append=TRUE)
##D cat('\end{document}\n', file=f, append=TRUE)
##D 
##D set.seed(135)
##D maj <- factor(c(rep('North',13),rep('South',13)))
##D g <- paste('Category',rep(letters[1:13],2))
##D n <- sample(1:15000, 26, replace=TRUE)
##D y1 <- runif(26)
##D y2 <- pmax(0, y1 - runif(26, 0, .1))
##D z <- latexDotchart(y1, g, groups=maj, auxdata=n, auxtitle='n', xlab='Y',
##D                    size.group.labels='large', ttlabels=TRUE)
##D f <- '/tmp/t2.tex'
##D cat('\documentclass{article}\n\usepackage{epic,color}\n\begin{document}\n\framebox{', file=f)
##D cat(z, sep='\n', file=f, append=TRUE)
##D cat('}\end{document}\n', file=f, append=TRUE)
## End(Not run)



