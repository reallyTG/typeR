library(llama)


### Name: plot
### Title: Plot convenience functions to visualise selectors
### Aliases: perfScatterPlot
### Keywords: models

### ** Examples

if(Sys.getenv("RUN_EXPENSIVE") == "true") {
data(satsolvers)
folds = cvFolds(satsolvers)
model = classify(classifier=makeLearner("classif.J48"), data=folds)

# Simple plot to compare our selector to the single best in terms of PAR10 score
library(ggplot2)
perfScatterPlot(parscores,
        model, singleBest,
        folds, satsolvers) +
    scale_x_log10() + scale_y_log10() +
    xlab("J48") + ylab("single best")

# additional aesthetics for points
perfScatterPlot(parscores,
        model, singleBest,
        folds, satsolvers,
        pargs=aes(colour = scorex)) +
    scale_x_log10() + scale_y_log10() +
    xlab("J48") + ylab("single best")
}



