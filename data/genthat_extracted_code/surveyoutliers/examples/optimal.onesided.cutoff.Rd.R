library(surveyoutliers)


### Name: optimal.onesided.cutoff
### Title: Optimal one-sided winsorization for survey outliers
### Aliases: optimal.onesided.cutoff

### ** Examples

test <- optimal.onesided.cutoff(formula=y~x1+x2,surveydata=survdat.example)
plot(test$windata$y,test$windata$win1.values)



