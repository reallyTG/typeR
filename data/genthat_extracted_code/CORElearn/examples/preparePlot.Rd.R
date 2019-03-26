library(CORElearn)


### Name: preparePlot
### Title: Prepare graphics device
### Aliases: preparePlot preparePlot.Core

### ** Examples

   # prepare a data set
    dat <- ordDataGen(200)
    # evaluate ordered features with ordEval
    oe <- ordEval(class ~ ., dat, ordEvalNoRandomNormalizers=200)
    # creates a separate postscript file for each attribute with given name     
    preparePlot("myGraph%03d.ps") 
    plot(oe)
    dev.off()



