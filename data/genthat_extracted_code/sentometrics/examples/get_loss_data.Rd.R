library(sentometrics)


### Name: get_loss_data
### Title: Retrieve loss data from a selection of models
### Aliases: get_loss_data

### ** Examples

## Not run: 
##D data("usnews", package = "sentometrics")
##D data("list_lexicons", package = "sentometrics")
##D data("list_valence_shifters", package = "sentometrics")
##D data("epu", package = "sentometrics")
##D 
##D set.seed(505)
##D 
##D # construct two sentomeasures objects
##D corpusAll <- sento_corpus(corpusdf = usnews)
##D corpus <- quanteda::corpus_subset(corpusAll, date >= "1997-01-01" & date < "2014-10-01")
##D l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")], list_valence_shifters[["en"]])
##D 
##D ctrA <- ctr_agg(howWithin = "proportionalPol", howDocs = "proportional",
##D                 howTime = c("equal_weight", "linear"), by = "month", lag = 3)
##D sentMeas <- sento_measures(corpus, l, ctrA)
##D 
##D # prepare y and other x variables
##D y <- epu[epu$date %in% get_dates(sentMeas), "index"]
##D length(y) == nobs(sentMeas1) # TRUE
##D x <- data.frame(runif(length(y)), rnorm(length(y))) # two other (random) x variables
##D colnames(x) <- c("x1", "x2")
##D 
##D # estimate different type of regressions
##D ctrM <- ctr_model(model = "gaussian", type = "AIC", do.iter = TRUE,
##D                  h = 0, nSample = 120, start = 50)
##D out1 <- sento_model(sentMeas, y, x = x, ctr = ctrM)
##D out2 <- sento_model(sentMeas, y, x = NULL, ctr = ctrM)
##D out3 <- sento_model(measures_select(sentMeas, "linear"), y, x = x, ctr = ctrM)
##D out4 <- sento_model(measures_select(sentMeas, "linear"), y, x = NULL, ctr = ctrM)
##D 
##D lossData <- get_loss_data(models = list(m1 = out1, m2 = out2, m3 = out3, m4 = out4),
##D                           loss = "errorSq")
##D 
##D mcs <- MCS::MCSprocedure(lossData)
## End(Not run)




