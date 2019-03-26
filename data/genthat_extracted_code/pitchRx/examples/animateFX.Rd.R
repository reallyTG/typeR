library(pitchRx)


### Name: animateFX
### Title: Animate PITCHf/x
### Aliases: animateFX

### ** Examples

data(pitches)
#generate animation and prompt default web browser to view the sequence of plots
## Not run: 
##D animation::saveHTML({ animateFX(pitches, layer = facet_grid(pitcher_name~stand)) })
##D animation::saveHTML({ animateFX(pitches, avg.by="pitch_types",
##D                          layer = facet_grid(pitcher_name~stand))
##D                    })
## End(Not run)



