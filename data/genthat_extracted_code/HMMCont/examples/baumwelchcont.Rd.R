library(HMMCont)


### Name: baumwelchcont
### Title: Baum-Welch Algorithm
### Aliases: baumwelchcont
### Keywords: Baum-Welch Hidden Markov Model

### ** Examples


Returns<-logreturns(Prices) # Getting a stationary process
Returns<-Returns*10 		# Scaling the values
hmm<-hmmsetcont(Returns) 	# Creating a HMM object
print(hmm) 					# Checking the initial parameters

hmm<-baumwelchcont(hmm) 	# First iteration
print(hmm)					# Inspecting

for(i in 1:5){hmm<-baumwelchcont(hmm)} # Subsequent iterations 
print(hmm)					# Inspecting

hmmcomplete<-viterbicont(hmm) # Viterbi execution
par(mfrow=c(2,1))
plot(hmmcomplete, Prices, ylabel="Price") 
plot(hmmcomplete, ylabel="Returns") # the revealed 
# Markov chain and the observations are plotted



