library(emuR)


### Name: get_trackdata
### Title: Get trackdata from loaded emuDB
### Aliases: get_trackdata emu.track
### Keywords: misc

### ** Examples

## Not run: 
##D 
##D ##################################
##D # prerequisite: loaded ae emuDB 
##D # (see ?load_emuDB for more information)
##D 
##D # query loaded "ae" emuDB for all "i:" segments of the "Phonetic" level
##D sl = query(emuDBhandle = ae, 
##D            query = "Phonetic == i:")
##D 
##D # get the corresponding formant trackdata
##D td = get_trackdata(emuDBhandle = ae, 
##D                    seglist = sl, 
##D                    ssffTrackName = "fm")
##D 
##D # get the corresponding F0 trackdata
##D # as there is no F0 ssffTrack defined in the "ae" emuDB we will 
##D # calculate the necessary values on-the-fly
##D td = get_trackdata(emuDBhandle = ae, 
##D                    seglist = sl, 
##D                    onTheFlyFunctionName = "ksvF0")
##D                    
## End(Not run)




