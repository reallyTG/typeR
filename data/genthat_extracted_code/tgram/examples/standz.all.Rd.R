library(tgram)


### Name: standz.all
### Title: Vaganov Normalized Tracheidogram
### Aliases: standz.all standz plot.standz.all
### Keywords: smooth manip

### ** Examples


data(juniperus)

cosa <- with(juniperus,
                  standz.all(traq=width.um, series=traqueidogram,
                                wl=lumen.wall, w.char="w", G=20)
                  )

plot(cosa, type="l")
plot(cosa, type="l", which="w")
plot(cosa, type="l", which="l", add=TRUE)

standz(with(juniperus,width.um[traqueidogram==1 & lumen.wall =="l"]), G=20)

lines(1:20,
      standz(with(juniperus,width.um[traqueidogram==1 & lumen.wall =="l"]), G=20),
      lwd=3)




