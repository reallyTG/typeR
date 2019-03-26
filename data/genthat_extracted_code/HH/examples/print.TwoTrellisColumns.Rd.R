library(HH)


### Name: print.TwoTrellisColumns
### Title: Print two conformable trellis plots in adjacent columns with
###   user control of widths.
### Aliases: print.TwoTrellisColumns5 as.TwoTrellisColumns5
###   leftLabels.trellis rightLabels.trellis panelOnly.trellis
###   mainSubLegend.trellis emptyRightAxis
### Keywords: hplot

### ** Examples



## These are based on the Professional Challenges example in ?likert
data(ProfChal)
levels(ProfChal$Subtable)[6] <- "Prof Recog" ## reduce length of label

## initial ordering of Question factor
PCC <- likert(Question ~ . | Subtable, ProfChal, ylab=NULL,
              rightAxis=TRUE,
              layout=c(1,6),
              strip=FALSE,
              strip.left=strip.custom(bg="gray97"),
              par.strip.text=list(cex=.7),
              scales=list(y=list(relation="free")),
              main="Is your job professionally challenging?")

## initial ordering of Question factor
PCP <- likert(Question ~ . | Subtable, ProfChal, ylab=NULL,
              as.percent=TRUE,
              layout=c(1,6),
              strip=FALSE,
              strip.left=strip.custom(bg="gray97"),
              par.strip.text=list(cex=.7),
              scales=list(y=list(relation="free")),
              main="Is your job professionally challenging?")

## Not run: 
##D ## default equal widths of the two panels
##D as.TwoTrellisColumns5(PCP, PCC)  ## 11in x 7in
##D 
##D ## make left panel twice as wide as right panel
##D as.TwoTrellisColumns5(PCP, PCC, pw=c(.3, .4, .01, .2, .09))  ## 11in x 7in
##D ##                                   --------------------    ## sum to 1.00
##D 
##D ## make left panel twice as wide as right panel, and control position of main and legend
##D as.TwoTrellisColumns5(PCP, PCC,  ## 11in x 7in
##D                       px=list(
##D                         LL=c(.00,  .30),
##D                         LP=c(.30,  .70),
##D                         ML=c(.60,  .61),  ## arbitrary,
##D                                           ## visually center the labels and legend
##D                         RP=c(.71,  .91),
##D                         RL=c(.91, 1.00)))
## End(Not run)

## Size that works in default 7x7 window.  7x7 is not recommended for
## this example because most of the space is used for labeling and not
## much for the panels containing the data.  Use the px values for the
## 11x7 illustrated above in the dontrun section.

as.TwoTrellisColumns5(PCP, PCC,  ## 7in x 7in
                      px=list(
                        LL=c(.00,  .50),
                        LP=c(.50,  .70),
                        ML=c(.50,  .51),  ## arbitrary,
                                          ## visually center the labels and legend
                        RP=c(.71,  .87),
                        RL=c(.87, 1.00)))

## Ordering the rows by the lengths of the positive bars and also
## put percents and counts on the same plot.
## The easiest way is to use the LikertPercentCountColumns function:

LikertPercentCountColumns(Question ~ . | Subtable, ProfChal,
                          layout=c(1,6), scales=list(y=list(relation="free")),
                          ylab=NULL, between=list(y=0),
                          strip.left=strip.custom(bg="gray97"), strip=FALSE,
                          par.strip.text=list(cex=.7),
                          positive.order=TRUE,
                          main="Is your job professionally challenging?")

## Not run: 
##D 
##D ## Ordering the rows by the lengths of the positive bars and also
##D ## putting percents and counts on the same plot requires coordination.
##D ## The easiest way is to order the original tables of counts by the
##D ## order of the percent plot.
##D 
##D percentPlot <- likert(Question ~ . | Subtable, ProfChal,
##D                       as.percent=TRUE,
##D                       layout=c(1,6), scales=list(y=list(relation="free")),
##D                       ylab=NULL, between=list(y=0),
##D                       strip.left=strip.custom(bg="gray97"), strip=FALSE,
##D                       par.strip.text=list(cex=.7),
##D                       positive.order=TRUE,
##D                       main="Is your job professionally challenging?")
##D ## percentPlot
##D pct.order <- percentPlot$y.limits[[1]]
##D 
##D ProfChal2 <- ProfChal
##D ProfChal2$Question <- factor(ProfChal2$Question, levels=rev(pct.order))
##D 
##D countPlot   <- likert(Question ~ . | Subtable, ProfChal2,
##D                       layout=c(1,6),
##D                       rightAxis=TRUE,
##D                       scales=list(y=list(relation="free"),
##D                                   x=list(at=c(0, 250, 500))),
##D                       ylab=NULL, between=list(y=0),
##D                       strip.left=strip.custom(bg="gray97"), strip=FALSE,
##D                       par.strip.text=list(cex=.7),
##D                       main="Is your job professionally challenging?")
##D ## countPlot
##D levels(ProfChal$Subtable)[6] <-
##D       "Attitude\ntoward\nProfessional\nRecognition" ## Restore original label
##D 
##D ## Size that works in default 7x7 window.  7x7 is not recommended for
##D ## this example because most of the space is used for labeling and not
##D ## much for the panels containing the data.  Use the px values for the
##D ## 11x7 illustrated above in the dontrun section.
##D 
##D as.TwoTrellisColumns5(percentPlot, countPlot,  ## 7in x 7in
##D                       px=list(
##D                         LL=c(.00,  .50),
##D                         LP=c(.50,  .70),
##D                         ML=c(.50,  .51),  ## arbitrary,
##D                                           ## visually center the labels and legend
##D                         RP=c(.71,  .87),
##D                         RL=c(.87, 1.00)))
## End(Not run)



