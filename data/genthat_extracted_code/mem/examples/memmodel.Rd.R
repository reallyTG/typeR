library(mem)


### Name: memmodel
### Title: Methods for influenza modelization
### Aliases: memmodel summary.flu,plot.flu,print.flu
### Keywords: influenza

### ** Examples

# Castilla y Leon Influenza Rates data
data(flucyl)
# Finds the timing of the first season: 2001/2002
epi<-memmodel(flucyl)
print(epi)
summary(epi)
plot(epi)




