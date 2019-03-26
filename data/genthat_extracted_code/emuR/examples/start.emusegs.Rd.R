library(emuR)


### Name: start.emusegs
### Title: Start and end times for EMU segment lists and trackdata objects
### Aliases: start.emusegs end.emusegs start.trackdata end.trackdata
### Keywords: utilities

### ** Examples


# start time of a segment list
start(polhom)
# duration of a segment list
end(polhom) - start(polhom)
# duration from start time of segment list
# and start time of parallel EPG trackdata
start(polhom) - start(polhom.epg)





