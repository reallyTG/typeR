library(pumilioR)


### Name: getFile
### Title: Download a sound file from Pumilio
### Aliases: getFile
### Keywords: pumilioR getFile

### ** Examples

	## Not run: 
##D 	#First, get a list of results
##D 	results <- getSounds(pumilio_URL = "http://pumilio.coquipr.com/pumilio/", 
##D 		SiteID = 111, type = "site")
##D 	
##D 	#Then, get the file from the first row, identified with the SoundID = 4078
##D 	getFile(results, SoundID = 4078)
##D 	
## End(Not run)



