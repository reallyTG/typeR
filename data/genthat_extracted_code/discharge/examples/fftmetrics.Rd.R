library(discharge)


### Name: fftmetrics
### Title: Summary of spectral anomolies for a specified year.
### Aliases: fftmetrics

### ** Examples

data(etowah)
etowah.flows=asStreamflow(etowah, river.name="Etowah")
# "candmax" chosen because preliminary analysis (e.g., with fourierAnalysis output) 
# shows the signal is highest sometime between day 40 and day 125.
# "candmin" can be estimated analogously.
fftmetrics(etowah.flows,2002,candmin=c(190:330),candmax=c(40:125)) 


