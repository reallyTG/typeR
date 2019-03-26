library(appnn)


### Name: plot
### Title: Plots generation of the amyloidogenicity propensity predicted
###   values per amino acid residue.
### Aliases: plot.appnn
### Keywords: ~kwd1 ~kwd2

### ** Examples

sequences <- c('STVIIE','KKSSTT','KYSTVI')
predictions <- appnn(sequences)
plot(predictions,c(1,2,3))



