library(vegetarian)


### Name: H
### Title: 'Standard Diversity Indices' for Alpha, Beta, and Gamma
###   Diversities
### Aliases: H

### ** Examples

data(simesants)
H(simesants[,-1]) #remove column with site names; calculates alpha diversity of entire data-set
hemlock<-subset(simesants,Habitat=="Hemlock")
H(hemlock[-1])#alpha diversity of just hemlock site
H(simesants[,-1],lev="gamma", q=0)#species richness for entire data set
H(simesants[,-1],q=2,boot=TRUE)
H(simesants[,-1],q=2,boot=TRUE,boot.arg=list(num.iter=1000))
simesants_freq<-normalize.rows(simesants[,-1])#not a necessary step, but just to show what you would do if your data were in the form of frequencies, not counts
H(simesants_freq,q=2,boot=TRUE,boot.arg=list(s.sizes=c(198,186,102,108,187)))




