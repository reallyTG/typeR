library(GENEAread)


### Name: get.intervals
### Title: Extract an interval of data.
### Aliases: get.intervals

### ** Examples


binfile  = system.file("binfile/TESTfile.bin", package = "GENEAread")[1]

#Read in a highly downsampled version of the file
procfile<-read.bin(binfile, downsample = 100)
print(procfile)

#Overlay some segments in different colour
lines(get.intervals(procfile, start = 0.4, end = 0.5,
                    time.format = "prop", incl.date = TRUE)[,1:2],
                    col=2)

lines(get.intervals(procfile, start = 0.4, end = 5,
                    time.format = "sec", incl.date = TRUE)[,1:2],
                    col=3)

lines(get.intervals(procfile, start = "16:51", end = "16:52",
                    time.format = "time", incl.date = TRUE)[,1:2],
                    col=4)

# Note that measurements will depend on the downsampling rate,
# not the original sampling rate of the data
lines(get.intervals(procfile, start = 100, length = 10,
                    time.format = "measurement", incl.date = TRUE)[,1:2],
                    col=5)

#This is also understood
lines(get.intervals(procfile, start = "16:52:10", 30,
                    incl.date = TRUE)[,1:2],
                    col=6)

#Now load in virtually
virtfile<-read.bin(binfile, virtual = TRUE)
#Notice that get.intervals with simplify = FALSE gives a genuine AccData object
realfile = get.intervals(virtfile, start = 0.5, end = 1, simplify = FALSE)
virtfile
realfile
#get.intervals calls read.bin automatically
points(get.intervals(virtfile, start = "16:52:10", "16:52:40",
                     incl.date = TRUE)[,1:2], col=4, pch = ".")

#Alternatively, re-read procfile at a different resampling rate.
lines(get.intervals(procfile, start = "16:49:00", "16:49:30",
                    incl.date = TRUE, read.from.file = TRUE, downsample = 300)[,1:2],
                    col=2)




