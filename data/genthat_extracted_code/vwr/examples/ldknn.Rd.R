library(vwr)


### Name: ldknn
### Title: Run the ldknn algorithm
### Aliases: ldknn ld1nn

### ** Examples

data(english.words)
data(basque.words)
# set up a mock experiment: English stimuli are words, Basque stimuli are nonwords
experiment<-data.frame(stimulus=c(sample(english.words,500),
 sample(basque.words,500)),
 type=factor(rep(c('Word','Nonword'),each=500),levels=c('Word','Nonword')))
# randomize the trials
experiment<-experiment[sample(1:1000,1000),]
# run the ldknn algorithm
results<-ldknn(experiment$stimulus,experiment$type,'Word')
print(results)
plot(results)



