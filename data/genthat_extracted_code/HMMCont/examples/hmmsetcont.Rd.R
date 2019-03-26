library(HMMCont)


### Name: hmmsetcont
### Title: Setting an initial HMM object
### Aliases: hmmsetcont print.ContObservHMM summary.ContObservHMM
###   plot.ContObservHMM
### Keywords: Hidden Markov Model Time series

### ** Examples


Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values

hmm<-hmmsetcont(Returns) 	# Creating a HMM object
print(hmm) 					# Checking the initial parameters

for(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is 
# executed 6 times and results are accumulated
hmmcomplete<-viterbicont(hmm) # Viterbi execution
print(hmm) 		# Checking the accumulated parameters
summary(hmm) 	# Getting more detailed information
par(mfrow=c(2,1))
plot(hmmcomplete, Prices, ylabel="Price") 
plot(hmmcomplete, ylabel="Returns") # the revealed 
# Markov chain and the observations are plotted



