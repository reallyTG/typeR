library(LSAfun)


### Name: plot_wordlist
### Title: 2D- or 3D-Plot of a list of words
### Aliases: plot_wordlist

### ** Examples
data(wonderland)

## Standard Plot

words <- c("alice","hatter","queen","knight","hare","cheshire") 
            
plot_wordlist(words,tvectors=wonderland,method="MDS",dims=2)




