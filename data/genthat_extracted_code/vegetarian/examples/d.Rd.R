library(vegetarian)


### Name: d
### Title: 'Numbers Equivalents' for Alpha, Beta and Gamma Diversity
###   Indices
### Aliases: d

### ** Examples

data(simesants)
d(simesants[,-1]) #remove column with site names; calculates alpha diversity of entire data-set
hemlock<-subset(simesants,Habitat=="Hemlock")
d(hemlock[-1])#alpha diversity of just hemlock site
d(simesants[,-1],lev="gamma", q=0)#species richness for entire data set
d(simesants[,-1],q=2,boot=TRUE)
d(simesants[,-1],q=2,boot=TRUE,boot.arg=list(num.iter=1000))
simesants_freq<-normalize.rows(simesants[,-1])#not a necessary step, but just to show what you would do if your data were in the form of frequencies, not counts
d(simesants_freq,q=2,boot=TRUE,boot.arg=list(s.sizes=c(198,186,102,108,187)))



