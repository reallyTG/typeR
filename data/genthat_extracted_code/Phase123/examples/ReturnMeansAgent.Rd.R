library(Phase123)


### Name: ReturnMeansAgent
### Title: Gives true mean survival times for doses considered of the
###   experimental agent.
### Aliases: ReturnMeansAgent

### ** Examples

##True Efficacy and Toxicity Probabilities
PT = c(.1,.15,.25,.35,.5)
PE=c(.2,.4,.6,.65,.7)
##Dose Levels considered
Dose = c(1,2,3,3.5,5)
Dose=(Dose-mean(Dose))/sd(Dose)
###Family of Distributions
Family="Gamma"
###Shape parameter ## Doesn't matter for exponential distribution
alpha=2
###True Beta vector
beta = c(.75,-.5, .3, -.25,2.143)
ReturnMeansAgent(PE,PT,beta,Dose,Family,alpha)



