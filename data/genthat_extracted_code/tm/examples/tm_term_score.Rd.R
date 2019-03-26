library(tm)


### Name: tm_term_score
### Title: Compute Score for Matching Terms
### Aliases: tm_term_score tm_term_score.DocumentTermMatrix
###   tm_term_score.term_frequency tm_term_score.PlainTextDocument
###   tm_term_score.TermDocumentMatrix

### ** Examples

data("acq")
tm_term_score(acq[[1]], c("company", "change"))
## Not run: 
##D ## Test for positive and negative sentiments
##D ## install.packages("tm.lexicon.GeneralInquirer", repos="http://datacube.wu.ac.at", type="source")
##D require("tm.lexicon.GeneralInquirer")
##D sapply(acq[1:10], tm_term_score, terms_in_General_Inquirer_categories("Positiv"))
##D sapply(acq[1:10], tm_term_score, terms_in_General_Inquirer_categories("Negativ"))
##D tm_term_score(TermDocumentMatrix(acq[1:10],
##D                                 control = list(removePunctuation = TRUE)),
##D              terms_in_General_Inquirer_categories("Positiv"))
## End(Not run)



