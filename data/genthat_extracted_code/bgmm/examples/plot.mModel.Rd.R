library(bgmm)


### Name: plot.mModel
### Title: Plotting a Graphical Visualization of a Gaussian Model or a List
###   of Models
### Aliases: plot.mModel

### ** Examples

 data(genotypes)
 modelSupervised = supervised(knowns=genotypes$knowns, class=genotypes$labels)
 plot(modelSupervised)

 # semi-supervised modeling
 modelSemiSupervised = semisupervised(X=genotypes$X, knowns=genotypes$knowns,
                           class = genotypes$labels)
 plot(modelSemiSupervised)

 # belief-based modeling
 modelBelief = belief(X=genotypes$X, knowns=genotypes$knowns, B=genotypes$B)
 plot(modelBelief)

 # soft-label modeling
 modelSoft = soft(X=genotypes$X, knowns=genotypes$knowns, P=genotypes$B)
 plot(modelSoft)

 # unsupervised modeling
 modelUnSupervised = unsupervised(X=genotypes$X, k=3)
 plot(modelUnSupervised)



