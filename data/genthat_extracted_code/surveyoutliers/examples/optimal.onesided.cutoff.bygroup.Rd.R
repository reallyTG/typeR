library(surveyoutliers)


### Name: optimal.onesided.cutoff.bygroup
### Title: Optimal one-sided winsorization for survey outliers by group
### Aliases: optimal.onesided.cutoff.bygroup

### ** Examples

test <- optimal.onesided.cutoff.bygroup(formula=y~x1+x2,
surveydata=survdat.example,groupname="industry")
plot(test$windata$y,test$windata$win1.values)



