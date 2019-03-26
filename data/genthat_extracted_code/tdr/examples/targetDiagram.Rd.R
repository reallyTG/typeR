library(tdr)


### Name: TargetDiagram
### Title: Target Diagrams
### Aliases: targetDiagram target_diagram tdTheme

### ** Examples

data(modelEx)

## Compute statistics
errModel <- applyStats(pvModels, pvObs)

## Display results
## Default settings use type = 'quantile'
targetDiagram(errModel, groups = model)

target_diagram(errModel, fill = 'model')

## whose breaks can be defined with 'cuts'
targetDiagram(errModel, groups = model,
              type = 'quantile',
              cuts = seq(0, 1, .1))

target_diagram(errModel, fill = 'model',
              type = 'quantile',
              cuts = seq(0, 1, .1))

## Alternatively, with type = 'at'
## one can define manually the breaks
targetDiagram(errModel, groups = model,
              type = 'at',
              cuts = seq(0, .1, .02))

target_diagram(errModel, fill = 'model',
              type = 'at',
              cuts = seq(0, .1, .02))




