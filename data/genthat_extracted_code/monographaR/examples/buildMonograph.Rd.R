library(monographaR)


### Name: buildMonograph
### Title: Build and export a monograph skeleton (draft)
### Aliases: buildMonograph

### ** Examples


data(monographaR_examples)
monographaR_examples$taxonomic_headings -> taxonomic.headings
monographaR_examples$collectorList -> col.d
monographaR_examples$examinedSpecimens -> exam.d
monographaR_examples$tableToDescription -> desc.d
desc.d[,-1] -> desc.d

###	buildMonograph(headings=taxonomic.headings, 
###               collectorList.data = col.d, 
###               examinedSpecimens.data = exam.d, 
###               tableToDescription.data = desc.d, 
###               output = "Word", title="Monograph skeleton")





