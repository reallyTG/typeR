library(VWPre)


### Name: fasttrack
### Title: Fast-track basic preprocessing
### Aliases: fasttrack

### ** Examples

## Not run: 
##D library(VWPre)
##D # Perform meta-function on data
##D df <- fasttrack(data = dat, Subject = "RECORDING_SESSION_LABEL", Item = "itemid", 
##D        EventColumns = c("Subject", "TRIAL_INDEX"), NoIA = 4, Adjust = 100, 
##D 			Recording = "LandR", WhenLandR = "Right", BinSize = 20, 
##D 			SamplingRate = 1000, ObsPerBin = 20, Constant = 0.5, 
##D 			Output = "ELogit")
## End(Not run)



