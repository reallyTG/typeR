library(monitoR)


### Name: mp3Subsamp
### Title: Extract Short Surveys from Longer mp3 Recordings
### Aliases: mp3Subsamp
### Keywords: IO file

### ** Examples

# Specify individual files, 10 minutes every hour from the file start:
## Not run: 
##D metadata <- mp3Subsamp(files = '~/media/SDcard/MA01.mp3', to = '~/Desktop/Acoustics/Recordings', 
##D csv.dir = '~/Desktop/Acoustics/Results', index = "time0", loc.prefix = 'MABI01', CardRecorderID = 1
## End(Not run)

# 10 minute surveys at the top of every hour, from an entire SD card:
## Not run: 
##D metadata <- mp3Subsamp(from = '~/media/SDcard', to = '~/Desktop/Acoustics/Recordings', 
##D csv.dir = '~/Desktop/Acoustics/Results', loc.prefix = 'MABI01', CardRecorderID = 1
## End(Not run)

# 5 minute surveys every 30 minutes starting at the top of every hour, from an entire SD card:
## Not run: 
##D metadata <- mp3Subsamp(from = '~/media/SDcard', to = '~/Desktop/Acoustics/Recordings', 
##D csv.dir = '~/Desktop/Acoustics/Results', duration = 300, mins.between = 25, loc.prefix = 'MABI01', 
##D CardRecorderID = 1
## End(Not run)








