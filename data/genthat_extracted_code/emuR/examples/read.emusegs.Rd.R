library(emuR)


### Name: read.emusegs
### Title: Create an Emu segment list from a file
### Aliases: read.emusegs
### Keywords: IO

### ** Examples


## create a segment list file and write it out
# seglist.txt <- "database:demo"\
# query:Phonetic=vowel\
# type:segment\
#\
# @:	3059.65	3343.65	msdjc001\
# e:	5958.55	6244.55	msdjc002\
# @u	8984.75	9288.75	msdjc003\
# A	11880.8	12184.8	msdjc004\
# E	17188.3	17366.4	msdjc005\
# ei	20315.2	20655.2	msdjc006"

## Not run: cat(seglist.txt, file="seglist.txt")

# now read it back as a segment list
## Not run: segs <- read.emusegs("seglist.txt")
## Not run: segs
## and clean up
## Not run: unlink("seglist.txt")





