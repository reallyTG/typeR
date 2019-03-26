library(latticeExtra)


### Name: resizePanels
### Title: Resize panels to match data scales
### Aliases: resizePanels
### Keywords: dplot

### ** Examples


state <- data.frame(state.x77, state.region, state.name)
state$state.name <-
    with(state, reorder(reorder(state.name, Frost),
                        as.numeric(state.region)))
dpfrost <-
    dotplot(state.name ~ Frost | reorder(state.region, Frost),
            data = state, layout = c(1, 4),
            scales = list(y = list(relation = "free")))

## approximate
resizePanels(dpfrost,
             h = with(state, table(reorder(state.region, Frost))))

## exact (including boundary padding)
resizePanels()




