library(deal)


### Name: genlatex
### Title: From a network family, generate LaTeX output
### Aliases: genlatex genpicfile
### Keywords: iplot

### ** Examples

data(rats)
allrats <- getnetwork(networkfamily(rats,network(rats)))
allrats <- nwfsort(allrats)

## Not run: dir.create("c:/temp")
## Not run: genpicfile(allrats,outdir="c:/temp/pic/")
## Not run: genlatex(allrats,outdir="c:/temp/pic/",picdir="c:/temp/pic/")

## LATEX FILE:
#\documentclass{article}
#\usepackage{array,pictex}
#\begin{document}
#\input{scoretable}
#\input{picnice}
#\end{document}

#data(ksl)
#ksl.nw  <- network(ksl)
#ksl.prior <- jointprior(ksl.nw,64)
#mybanlist <- matrix(c(5,5,6,6,7,7,9,
#                    8,9,8,9,8,9,8),ncol=2)
#banlist(ksl.nw) <- mybanlist                  
#ksl.nw <- getnetwork(learn(ksl.nw,ksl,ksl.prior))
#ksl.search <- autosearch(ksl.nw,ksl,ksl.prior,
#                      trace=TRUE)
#ksl.searchlist <- makenw(ksl.search$table,ksl.search$nw)
#ksl.searchlist <- nwfsort(ksl.searchlist)
## Not run: genpicfile(ksl.searchlist)
## Not run: genlatex(ksl.searchlist)




