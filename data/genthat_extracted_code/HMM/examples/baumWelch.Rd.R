library(HMM)


### Name: baumWelch
### Title: Inferring the parameters of a Hidden Markov Model via the
###   Baum-Welch algorithm
### Aliases: baumWelch
### Keywords: methods

### ** Examples

# Initial HMM
hmm = initHMM(c("A","B"),c("L","R"),
	transProbs=matrix(c(.9,.1,.1,.9),2),
	emissionProbs=matrix(c(.5,.51,.5,.49),2))
print(hmm)
# Sequence of observation
a = sample(c(rep("L",100),rep("R",300)))
b = sample(c(rep("L",300),rep("R",100)))
observation = c(a,b)
# Baum-Welch
bw = baumWelch(hmm,observation,10)
print(bw$hmm)



