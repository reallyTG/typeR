library(tgram)


### Name: juniperus
### Title: Traqueid Measurements in Juniperus thurifera
### Aliases: juniperus
### Keywords: datasets

### ** Examples

data(juniperus)
cosa <- with(juniperus, 
                  standz.all(traq=width.um, series=traqueidogram,
                                 wl=lumen.wall, w.char="w", G=20)
                  ) 

plot(cosa, type="l")




