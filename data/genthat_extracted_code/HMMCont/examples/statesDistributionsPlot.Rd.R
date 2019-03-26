library(HMMCont)


### Name: statesDistributionsPlot
### Title: Probability Density Functions of the States
### Aliases: statesDistributionsPlot
### Keywords: Baum-Welch Viterbi

### ** Examples


Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values
hmm<-hmmsetcont(Returns) 	# Creating a HMM object
for(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is 
# executed 6 times and results are accumulated
hmmcomplete<-viterbicont(hmm) # Viterbi execution

statesDistributionsPlot(hmmcomplete, sc=10) # PDFs of 
# the whole data set and two states are plotted 



