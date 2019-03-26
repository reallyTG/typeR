library(echogram)


### Name: sample.echogram
### Title: Select and sample data values from an echogram
### Aliases: sample.echogram
### Keywords: manip

### ** Examples


# import 38 and 120 kHz data from an HAC file 
hacfile <- system.file("hac", "D20150510-T202500.hac", package = "echogram")
echo2.038 <- read.echogram(hacfile, channel = 1)
echo2.120 <- read.echogram(hacfile, channel = 2)

# plot 38 kHz echogram 
echogram(echo2.038)

## Not run: 
##D  
##D # select points coordinates with the mouse 
##D # click to select several locations and escape when done
##D pts038 <- sample.echogram(echo2.038) 
##D pts038
##D 
##D # plot 120 kHz echogram 
##D echogram(echo2.120)
##D 
##D # use the points previously selected for 38 kHz
##D pts120 <- sample.echogram(echo2.120, coords = pts038[ , 2:3])
##D pts120
## End(Not run)



