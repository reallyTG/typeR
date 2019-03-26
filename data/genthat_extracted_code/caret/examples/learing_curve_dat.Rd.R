library(caret)


### Name: learing_curve_dat
### Title: Create Data to Plot a Learning Curve
### Aliases: learing_curve_dat
### Keywords: models

### ** Examples


## Not run: 
##D set.seed(1412)
##D class_dat <- twoClassSim(1000)
##D 
##D set.seed(29510)
##D lda_data <- learing_curve_dat(dat = class_dat,
##D                               outcome = "Class",
##D                               test_prop = 1/4,
##D                               ## `train` arguments:
##D                               method = "lda",
##D                               metric = "ROC",
##D                               trControl = trainControl(classProbs = TRUE,
##D                                                        summaryFunction = twoClassSummary))
##D 
##D 
##D 
##D ggplot(lda_data, aes(x = Training_Size, y = ROC, color = Data)) +
##D   geom_smooth(method = loess, span = .8) +
##D   theme_bw()
##D  
## End(Not run)




