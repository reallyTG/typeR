library(HMMCont)


### Name: HMMCont-package
### Title: Hidden Markov Model for Continuous Observations Processes
### Aliases: HMMCont-package HMMCont
### Keywords: Hidden Markov Model Time series Continuous observations
###   Econometrics Quantitative Finance

### ** Examples

# Step-by-step analysis example.

Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values

hmm<-hmmsetcont(Returns) 	# Creating a HMM object
print(hmm) 		# Checking the initial parameters

for(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is 
# executed 6 times and results are accumulated
print(hmm) 		# Checking the accumulated parameters
summary(hmm) 	# Getting more detailed information

hmmcomplete<-viterbicont(hmm) # Viterbi execution

statesDistributionsPlot(hmmcomplete, sc=10) # PDFs of 
# the whole data set and two states are plotted 
par(mfrow=c(2,1))
plot(hmmcomplete, Prices, ylabel="Price") 
plot(hmmcomplete, ylabel="Returns") # the revealed 
# Markov chain and the observations are plotted



