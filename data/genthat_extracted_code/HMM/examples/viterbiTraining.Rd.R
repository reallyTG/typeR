library(HMM)


### Name: viterbiTraining
### Title: Inferring the parameters of a Hidden Markov Model via
###   Viterbi-training
### Aliases: viterbiTraining
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
# Viterbi-training
vt = viterbiTraining(hmm,observation,10)
print(vt$hmm)



