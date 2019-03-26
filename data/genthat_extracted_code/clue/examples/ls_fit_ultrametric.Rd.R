library(clue)


### Name: ls_fit_ultrametric
### Title: Least Squares Fit of Ultrametrics to Dissimilarities
### Aliases: ls_fit_ultrametric
### Keywords: cluster optimize

### ** Examples

## Least squares fit of an ultrametric to the Miller-Nicely consonant
## phoneme confusion data.
data("Phonemes")
## Note that the Phonemes data set has the consonant misclassification
## probabilities, i.e., the similarities between the phonemes.
d <- as.dist(1 - Phonemes)
u <- ls_fit_ultrametric(d, control = list(verbose = TRUE))
## Cophenetic correlation:
cor(d, u)
## Plot:
plot(u)
## ("Basically" the same as Figure 1 in de Soete (1986).)



