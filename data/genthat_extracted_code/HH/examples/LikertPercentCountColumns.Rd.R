library(HH)


### Name: LikertPercentCountColumns
### Title: Display likert plots with percents in the first column of panels
###   and counts in the second column of panels.
### Aliases: LikertPercentCountColumns
### Keywords: hplot

### ** Examples


## These are based on the Professional Challenges example in ?likert
data(ProfChal)

levels(ProfChal$Subtable)[6] <- "Prof Recog" ## reduce length of label

## See ?print.TwoTrellisColumns for this example using the original ordering

## Order both the plot of the count plot and the percent plot by the
## positive.order of the percent plot.

LikertPercentCountColumns(Question ~ . | Subtable, ProfChal,
                          layout=c(1,6), scales=list(y=list(relation="free")),
                          ylab=NULL, between=list(y=0),
                          strip.left=strip.custom(bg="gray97"), strip=FALSE,
                          par.strip.text=list(cex=.7),
                          positive.order=TRUE,
                          main="Is your job professionally challenging?")
## Not run: 
##D ## Retain original order of the Question variable
##D 
##D LikertPercentCountColumns(Question ~ . | Subtable, ProfChal,
##D                           layout=c(1,6), scales=list(y=list(relation="free")),
##D                           ylab=NULL, between=list(y=0),
##D                           strip.left=strip.custom(bg="gray97"), strip=FALSE,
##D                           par.strip.text=list(cex=.7),
##D                           main="Is your job professionally challenging?")
##D 
##D ## Order both the plot of the count plot and the percent plot by the
##D ## positive.order of the percent plot.
##D ## Just the "Employment sector".
##D LPCCEs <-
##D LikertPercentCountColumns(Question ~ . ,
##D                           ProfChal[ProfChal$Subtable == "Employment sector", -7],
##D                           ylab=NULL, between=list(y=0),
##D                           par.strip.text=list(cex=.7),
##D                           positive.order=TRUE,
##D                           main="Is your job professionally challenging?\nEmployment sector",
##D                           px=list( ## defaults designed for long QuestionName values
##D                             LL=c(.00,  .50), ## and 7in x 7in window
##D                             LP=c(.49,  .70),
##D                             ML=c(.50,  .51),  ## arbitrary, visually center the labels and legend
##D                             RP=c(.71,  .84),
##D                             RL=c(.87, 1.00)))
##D LPCCEs$RP$x.scales$at <- c(0,100,200)
##D LPCCEs$RP$x.scales$labels <- c(0,100,200)
##D LPCCEs
## End(Not run)



