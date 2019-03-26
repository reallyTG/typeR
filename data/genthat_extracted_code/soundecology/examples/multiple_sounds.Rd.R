library(soundecology)


### Name: multiple_sounds
### Title: Multiple sound files
### Aliases: multiple_sounds
### Keywords: soundecology multiple_sounds

### ** Examples

	## Not run: 
##D 		#Calculate the ACI of all the wav
##D 		# files in the directory "/home/user/wavs/"
##D 		# using the function acoustic_complexity
##D 		multiple_sounds(directory = "/home/user/wavs/", 
##D 			resultfile = "/home/user/results.csv", 
##D 			soundindex = "acoustic_complexity")
##D 		
##D 		#Calculate the same as above using 12000Hz as the
##D 		# maximum frequency instead of the default.
##D 		multiple_sounds(directory = "/home/user/wavs/", 
##D 			resultfile = "/home/user/results.csv", 
##D 			soundindex = "acoustic_complexity", max_freq = 12000)
##D 			
##D 		#Calculate the same as above using two cores
##D 		multiple_sounds(directory = "/home/user/wavs/", 
##D 			resultfile = "/home/user/results.csv", 
##D 			soundindex = "acoustic_complexity", no_cores = 2)
##D 			
##D 		#Calculate the same as above using all the cores
##D 		# the computer has
##D 		multiple_sounds(directory="/home/user/wavs/", 
##D 			resultfile = "/home/user/results.csv", 
##D 			soundindex = "acoustic_complexity", no_cores = "max")
##D 			
##D 		#Calculate the same as above using all but one cores
##D 		multiple_sounds(directory = "/home/user/wavs/", 
##D 			resultfile = "/home/user/results.csv", 
##D 			soundindex = "acoustic_complexity", no_cores = -1)
##D 		
## End(Not run)
	


