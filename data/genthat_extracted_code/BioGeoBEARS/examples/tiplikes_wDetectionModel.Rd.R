library(BioGeoBEARS)


### Name: tiplikes_wDetectionModel
### Title: Calculate probability of detection data for each OTU at each
###   range in a list of states/geographic ranges
### Aliases: tiplikes_wDetectionModel

### ** Examples

testval=1

# soft-coded input files
extdata_dir = np(system.file("extdata", package="BioGeoBEARS"))
detects_fn = np(paste(extdata_dir, "/Psychotria_detections_v1.txt", sep=""))
controls_fn = np(paste(extdata_dir, "/Psychotria_controls_v1.txt", sep=""))

detects_df = read_detections(detects_fn, OTUnames=NULL, areanames=NULL, tmpskip=0)
controls_df = read_controls(controls_fn, OTUnames=NULL, areanames=NULL, tmpskip=0)

# Calculate the likelihood of the data at each tip, for each possible geographic range
numareas = 4
tmpranges = list(c(0), c(1), c(0,1))

mean_frequency=0.1
dp=1
fdp=0

tip_condlikes_of_data_on_each_state =
tiplikes_wDetectionModel(states_list_0based_index=tmpranges, numareas=numareas,
detects_df, controls_df, mean_frequency=mean_frequency, dp=dp, fdp=fdp,
null_range_gets_0_like=TRUE)

tip_condlikes_of_data_on_each_state



