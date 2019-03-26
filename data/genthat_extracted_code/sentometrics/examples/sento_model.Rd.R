library(sentometrics)


### Name: sento_model
### Title: Optimized and automated sentiment-based sparse regression
### Aliases: sento_model

### ** Examples

## Not run: 
##D data("usnews", package = "sentometrics")
##D data("list_lexicons", package = "sentometrics")
##D data("list_valence_shifters", package = "sentometrics")
##D data("epu", package = "sentometrics")
##D 
##D set.seed(505)
##D 
##D # construct a sentomeasures object to start with
##D corpusAll <- sento_corpus(corpusdf = usnews)
##D corpus <- quanteda::corpus_subset(corpusAll, date >= "2004-01-01")
##D l <- sento_lexicons(list_lexicons[c("LM_en", "HENRY_en")])
##D ctr <- ctr_agg(howWithin = "counts", howDocs = "proportional",
##D                howTime = c("equal_weight", "linear"),
##D                by = "month", lag = 3)
##D sentomeasures <- sento_measures(corpus, l, ctr)
##D 
##D # prepare y and other x variables
##D y <- epu[epu$date %in% get_dates(sentomeasures), "index"]
##D length(y) == nobs(sentomeasures) # TRUE
##D x <- data.frame(runif(length(y)), rnorm(length(y))) # two other (random) x variables
##D colnames(x) <- c("x1", "x2")
##D 
##D # a linear model based on the Akaike information criterion
##D ctrIC <- ctr_model(model = "gaussian", type = "AIC", do.iter = FALSE, h = 4,
##D                    do.difference = TRUE)
##D out1 <- sento_model(sentomeasures, y, x = x, ctr = ctrIC)
##D 
##D # attribution and prediction as post-analysis
##D attributions1 <- attributions(out1, sentomeasures,
##D                               refDates = get_dates(sentomeasures)[20:25])
##D plot(attributions1, "features")
##D 
##D nx <- nmeasures(sentomeasures) + ncol(x)
##D newx <- runif(nx) * cbind(get_measures(sentomeasures)[, -1], x)[30:40, ]
##D preds <- predict(out1, newx = as.matrix(newx), type = "link")
##D 
##D # an iterative out-of-sample analysis, parallelized
##D ctrIter <- ctr_model(model = "gaussian", type = "BIC", do.iter = TRUE, h = 3,
##D                      oos = 2, alphas = c(0.25, 0.75), nSample = 75, nCore = 2)
##D out2 <- sento_model(sentomeasures, y, x = x, ctr = ctrIter)
##D summary(out2)
##D 
##D # plot predicted vs. realized values
##D p <- plot(out2)
##D p
##D 
##D # a cross-validation based model, parallelized
##D cl <- parallel::makeCluster(2)
##D doParallel::registerDoParallel(cl)
##D ctrCV <- ctr_model(model = "gaussian", type = "cv", do.iter = FALSE,
##D                    h = 0, alphas = c(0.10, 0.50, 0.90), trainWindow = 70,
##D                    testWindow = 10, oos = 0, do.progress = TRUE)
##D out3 <- sento_model(sentomeasures, y, x = x, ctr = ctrCV)
##D parallel::stopCluster(cl)
##D foreach::registerDoSEQ()
##D summary(out3)
##D 
##D # a cross-validation based model for a binomial target
##D yb <- epu[epu$date %in% get_dates(sentomeasures), "above"]
##D ctrCVb <- ctr_model(model = "binomial", type = "cv", do.iter = FALSE,
##D                     h = 0, alphas = c(0.10, 0.50, 0.90), trainWindow = 70,
##D                     testWindow = 10, oos = 0, do.progress = TRUE)
##D out4 <- sento_model(sentomeasures, yb, x = x, ctr = ctrCVb)
##D summary(out4)
## End(Not run)




