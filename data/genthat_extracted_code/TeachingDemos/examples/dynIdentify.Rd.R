library(TeachingDemos)


### Name: dynIdentify
### Title: Interacively place labels for points in a plot
### Aliases: dynIdentify TkIdentify
### Keywords: dynamic aplot

### ** Examples

if(interactive()) {
  tmp <- TkIdentify(state.x77[,'Frost'], state.x77[,'Murder'],
  state.abb)
     ### now move the labels

     ### recreate the graph on the current device
  plot( state.x77[,'Frost'], state.x77[,'Murder'],
        xlab='Frost', ylab='Frost')
  text( tmp$labels$x, tmp$labels$y, state.abb )
  segments( state.x77[,'Frost'], state.x77[,'Murder'],
            tmp$lineends$x, tmp$lineends$y )
}



