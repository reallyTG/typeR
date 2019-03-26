library(HMMCont)


### Name: viterbicont
### Title: Viterbi Algorithm
### Aliases: viterbicont
### Keywords: Viterbi Hidden Markov Model

### ** Examples


Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values
hmm<-hmmsetcont(Returns) 	# Creating a HMM object
for(i in 1:6){hmm<-baumwelchcont(hmm)} # Baum-Welch is 
# executed 6 times and results are accumulated

hmmcomplete<-viterbicont(hmm) # Viterbi execution

par(mfrow=c(2,1))
plot(hmmcomplete, Prices, ylabel="Price") 
plot(hmmcomplete, ylabel="Returns") # the revealed 
# Markov chain and the observations are plotted



