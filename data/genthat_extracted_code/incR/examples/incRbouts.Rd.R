library(incR)


### Name: incRbouts
### Title: Calculation of the number of daily on- and off-bouts
### Aliases: incRbouts

### ** Examples

#' # loading example data
data(incR_procdata)
incRbouts (data=incR_procdata, 
           vector.incubation="incR_score", 
           dec_time="dec_time",
           temp="temperature",
           sampling.rate=240) # sampling rate in seconds.



