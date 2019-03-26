library(quanteda)


### Name: textmodel_nb
### Title: Naive Bayes classifier for texts
### Aliases: textmodel_nb

### ** Examples

## Example from 13.1 of _An Introduction to Information Retrieval_
txt <- c(d1 = "Chinese Beijing Chinese",
         d2 = "Chinese Chinese Shanghai",
         d3 = "Chinese Macao",
         d4 = "Tokyo Japan Chinese",
         d5 = "Chinese Chinese Chinese Tokyo Japan")
trainingset <- dfm(txt, tolower = FALSE)
trainingclass <- factor(c("Y", "Y", "Y", "N", NA), ordered = TRUE)
 
## replicate IIR p261 prediction for test set (document 5)
(nb <- textmodel_nb(trainingset, trainingclass, prior = "docfreq"))
summary(nb)
coef(nb)
predict(nb)

# contrast with other priors
predict(textmodel_nb(trainingset, trainingclass, prior = "uniform"))
predict(textmodel_nb(trainingset, trainingclass, prior = "termfreq"))

## replicate IIR p264 Bernoulli Naive Bayes
nb_bern <- textmodel_nb(trainingset, trainingclass, distribution = "Bernoulli", 
                        prior = "docfreq")
predict(nb_bern, newdata = trainingset[5, ])



