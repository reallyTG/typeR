library(emuR)


### Name: modify.seglist
### Title: Modify one of the components of an Emu segment list
### Aliases: modify.seglist
### Keywords: misc

### ** Examples


data(vowlax)
segs = vowlax
# extend the start times by 10ms
newsegs <- modify.seglist( segs, start=start(segs)+10 )

# change the associated database name
# this will affect where emu.track looks to find data
newsegs <-  modify.seglist( segs, database="notdemo" )





