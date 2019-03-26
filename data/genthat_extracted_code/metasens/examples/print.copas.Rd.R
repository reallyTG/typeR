library(metasens)


### Name: print.copas
### Title: Print and summary method for Copas selection model
### Aliases: print.copas summary.copas print.summary.copas
### Keywords: print

### ** Examples

##
## Load data
##
data(Fleiss93)
##
## Perform meta analysis, effect measure is odds ratio (OR)
##
meta1 <- metabin(event.e, n.e, event.c, n.c,
                 data=Fleiss93, sm="OR")
##
## Perform Copas analysis
##
cop1 <- copas(meta1)
summary(cop1, level=0.95)



