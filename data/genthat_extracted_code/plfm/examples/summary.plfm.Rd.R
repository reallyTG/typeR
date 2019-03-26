library(plfm)


### Name: summary.plfm
### Title: Summarizing probabilistic latent feature analysis
### Aliases: summary.plfm

### ** Examples

## Perceptual analysis of associations between car models and car attributes

##load car data
data(car)

##compute the disjunctive model with 4 features
carf4<-plfm(maprule="disj",freq1=car$freq1,freqtot=car$freqtot,F=4,M=1)

## display a summary of the results
summary(carf4)



