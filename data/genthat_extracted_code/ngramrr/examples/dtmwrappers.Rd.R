library(ngramrr)


### Name: dtmwrappers
### Title: Wrappers to DocumentTermMatrix and DocumentTermMatrix to use
###   n-gram tokenizaion
### Aliases: dtm2 dtmwrappers tdm2

### ** Examples

nirvana <- c("hello hello hello how low", "hello hello hello how low",
"hello hello hello how low", "hello hello hello",
"with the lights out", "it's less dangerous", "here we are now", "entertain us",
"i feel stupid", "and contagious", "here we are now", "entertain us",
"a mulatto", "an albino", "a mosquito", "my libido", "yeah", "hey yay")
dtm2(nirvana, ngmax = 3, removePunctuation = TRUE)



