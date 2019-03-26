library(biomod2)


### Name: models_scores_graph
### Title: Produce models evaluation bi-dimensional graph
### Aliases: models_scores_graph
### Keywords: evaluation scores graph

### ** Examples

## this example is based on BIOMOD_Modeling function example
example(BIOMOD_Modeling)

## plot evaluation models score graph

### by models
gg1 <- models_scores_graph( myBiomodModelOut,
                            by = 'models',
                            metrics = c('ROC','TSS') )
## we see a influence of model selected on models capabilities
## e.g. RF are much better than SRE

### by cross validation run
gg2 <- models_scores_graph( myBiomodModelOut,
                            by = 'cv_run',
                            metrics = c('ROC','TSS') )
## there is no difference in models quality if we focus on 
## cross validation sampling

### some graphical customisations
gg1_custom <- 
  gg1 + 
  ggtitle("Diff between RF and SRE evaluation scores") + ## add title
  scale_colour_manual(values=c("green", "blue")) ## change colors

gg1_custom




