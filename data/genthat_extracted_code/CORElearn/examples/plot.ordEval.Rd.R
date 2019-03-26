library(CORElearn)


### Name: plot.ordEval
### Title: Visualization of ordEval results
### Aliases: plotOrdEval plot.ordEval printOrdEval
### Keywords: classif

### ** Examples

    # prepare a data set
    dat <- ordDataGen(200)

    # evaluate ordered features with ordEval
    oe <- ordEval(class ~ ., dat, ordEvalNoRandomNormalizers=200)
    plot(oe)
    # printOrdEval(oe)
    
    # the same effect we achieve by storing results to files
    tmp <- ordEval(class ~ ., dat, file="profiles.oe", 
                  rndFile="profiles.oer", ordEvalNoRandomNormalizers=200)   
    plotOrdEval(file="profiles.oe", rndFile="profiles.oer",
                graphType="attrBar")
    



