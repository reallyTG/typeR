library(HH)


### Name: likert
### Title: Diverging stacked barcharts for Likert, semantic differential,
###   rating scale data, and population pyramids.
### Aliases: likert plot.likert likertplot plot.likert.formula
###   plot.likert.default plot.likert.array plot.likert.likert
###   plot.likert.list plot.likert.table plot.likert.ftable
###   plot.likert.structable plot.likert.data.frame
###   xscale.components.top.HH yscale.components.right.HH floating pyramid
###   sliding semantic differential
### Keywords: hplot shiny

### ** Examples


## See file HH/demo/likert-paper.r for a complete set of examples using
## the formula method into the underlying lattice:::barchart plotting
## technology.  See file HH/demo/likert-paper-noFormula.r for the same
## set of examples using the matrix and list of matrices methods.  See
## file HH/demo/likertMosaic-paper.r for the same set of examples using
## the still experimental functions built on the vcd:::mosaic as the
## underlying plotting technology

data(ProfChal)  ## ProfChal is a data.frame.
## See below for discussion of the dataset.


## Count plot
likert(Question ~ . , ProfChal[ProfChal$Subtable=="Employment sector",],
       main='Is your job professionally challenging?',
       ylab=NULL,
       sub="This plot looks better in a 9in x 4in window.")

## Percent plot calculated automatically from Count data
likert(Question ~ . , ProfChal[ProfChal$Subtable=="Employment sector",],
       as.percent=TRUE,
       main='Is your job professionally challenging?',
       ylab=NULL,
       sub="This plot looks better in a 9in x 4in window.")

## formula method
data(NZScienceTeaching)
likert(Question ~ . | Subtable, data=NZScienceTeaching,
       ylab=NULL,
       scales=list(y=list(relation="free")), layout=c(1,2))

## Not run: 
##D ## formula notation with expanded right-hand-side
##D likert(Question ~
##D        "Strongly disagree" + Disagree + Neutral + Agree + "Strongly agree" |
##D        Subtable, data=NZScienceTeaching,
##D        ylab=NULL,
##D        scales=list(y=list(relation="free")), layout=c(1,2))
## End(Not run)

## Not run: 
##D ## formula notation with long data arrangement
##D NZScienceTeachingLong <- reshape2::melt(NZScienceTeaching,
##D                                         id.vars=c("Question", "Subtable"))
##D names(NZScienceTeachingLong)[3] <- "Agreement"
##D head(NZScienceTeachingLong)
##D 
##D likert(Question ~ Agreement | Subtable, value="value", data=NZScienceTeachingLong,
##D        ylab=NULL,
##D        scales=list(y=list(relation="free")), layout=c(1,2))
## End(Not run)

## Examples with higher-dimensional arrays.
tmp3 <- array(1:24, dim=c(2,3,4),
              dimnames=list(A=letters[1:2], B=LETTERS[3:5], C=letters[6:9]))

## positive.order=FALSE is the default.  With arrays
## the rownames within each item of an array are identical.

## likert(tmp3)
likert(tmp3, layout=c(1,4))
likert(tmp3, layout=c(2,2), resize.height=c(2,1), resize.width=c(3,4))


## plot.likert interprets vectors as single-row matrices.
## http://survey.cvent.com/blog/customer-insights-2/box-scores-are-not-just-for-baseball
Responses <- c(15, 13, 12, 25, 35)
names(Responses) <- c("Strongly Disagree", "Disagree", "No Opinion",
                      "Agree", "Strongly Agree")
## Not run: 
##D likert(Responses, main="Retail-R-Us offers the best everyday prices.",
##D        sub="This plot looks better in a 9in x 2.6in window.")
## End(Not run)
## reverse=TRUE  is needed for a single-column key with
## horizontal=FALSE and with space="right"
likert(Responses, horizontal=FALSE,
       aspect=1.5,
       main="Retail-R-Us offers the best everyday prices.",
       auto.key=list(space="right", columns=1,
                     reverse=TRUE, padding.text=2),
       sub="This plot looks better in a 4in x 3in window.")


## Not run: 
##D ## Since age is always positive and increases in a single direction,
##D ## this example uses colors from a sequential palette for the age
##D ## groups.  In this example we do not use a diverging palette that is
##D ## appropriate when groups are defined by a characteristic, such as
##D ## strength of agreement or disagreement, that can increase in two directions.
##D 
##D ## Initially we use the default Blue palette in the sequential_hcl function.
##D data(AudiencePercent)
##D likert(AudiencePercent,
##D        auto.key=list(between=1, between.columns=2),
##D        xlab=paste("Percentage of audience younger than 35 (left of zero)",
##D                   "and older than 35 (right of zero)"),
##D        main="Target Audience",
##D        col=rev(colorspace::sequential_hcl(4)),
##D        sub="This plot looks better in a 7in x 3.5in window.")
##D 
##D ## The really light colors in the previous example are too light.
##D ## Therefore we use the col argument directly.  We chose to use an
##D ## intermediate set of Blue colors selected from a longer Blue palette.
##D likert(AudiencePercent,
##D        positive.order=TRUE,
##D        auto.key=list(between=1, between.columns=2),
##D        xlab=paste("Percentage of audience younger than 35",
##D          "(left of zero) and older than 35 (right of zero)"),
##D        main="Brand A has the most even distribution of ages",
##D        col=colorspace::sequential_hcl(11)[5:2],
##D        scales=list(x=list(at=seq(-90,60,10),
##D                      labels=as.vector(rbind("",seq(-80,60,20))))),
##D       sub="This plot looks better in a 7in x 3.5in window.")
## End(Not run)


## Not run: 
##D ## See the ?as.pyramidLikert help page for these examples
##D ## Population Pyramid
##D data(USAge.table)
##D USA79 <- USAge.table[75:1, 2:1, "1979"]/1000000
##D PL <- likert(USA79,
##D              main="Population of United States 1979 (ages 0-74)",
##D              xlab="Count in Millions",
##D              ylab="Age",
##D              scales=list(
##D                y=list(
##D                  limits=c(0,77),
##D                  at=seq(1,76,5),
##D                  labels=seq(0,75,5),
##D                  tck=.5))
##D              )
##D PL
##D as.pyramidLikert(PL)
##D 
##D likert(USAge.table[75:1, 2:1, c("1939","1959","1979")]/1000000,
##D        main="Population of United States 1939,1959,1979 (ages 0-74)",
##D        sub="Look for the Baby Boom",
##D        xlab="Count in Millions",
##D        ylab="Age",
##D        scales=list(
##D          y=list(
##D            limits=c(0,77),
##D            at=seq(1,76,5),
##D            labels=seq(0,75,5),
##D            tck=.5)),
##D        strip.left=FALSE, strip=TRUE,
##D        layout=c(3,1), between=list(x=.5))
## End(Not run)


Pop <- rbind(a=c(3,2,4,9), b=c(6,10,12,10))
dimnames(Pop)[[2]] <- c("Very Low", "Low", "High", "Very High")
likert(as.listOfNamedMatrices(Pop),
            as.percent=TRUE,
            resize.height="rowSums",
            strip=FALSE,
            strip.left=FALSE,
            main=paste("Area and Height are proportional to 'Row Count Totals'.",
                       "Width is exactly 100%.", sep="\n"))


## Professional Challenges example.
##
## The data for this example is a list of related likert scales, with
## each item in the list consisting of differently named rows.  The data
## is from a questionnaire analyzed in a recent Amstat News article.
## The study population was partitioned in several ways.  Data from one
## of the partitions (Employment sector) was used in the first example
## in this help file.  The examples here show various options for
## displaying all partitions on the same plot.
##
data(ProfChal)
levels(ProfChal$Subtable)[6] <- "Prof Recog" ## reduce length of label

## 1. Plot counts with rows in each panel sorted by positive counts.
##
## Not run: 
##D likert(Question ~ . | Subtable, ProfChal,
##D        positive.order=TRUE,
##D        main="This works, but needs more specified arguments to look good")
##D 
##D likert(Question ~ . | Subtable, ProfChal,
##D        scales=list(y=list(relation="free")), layout=c(1,6),
##D        positive.order=TRUE,
##D        between=list(y=0),
##D        strip=FALSE, strip.left=strip.custom(bg="gray97"),
##D        par.strip.text=list(cex=.6, lines=5),
##D        main="Is your job professionally challenging?",
##D        ylab=NULL,
##D        sub="This looks better in a 10inx7in window")
## End(Not run)

ProfChalCountsPlot <-
likert(Question ~ . | Subtable, ProfChal,
       scales=list(y=list(relation="free")), layout=c(1,6),
       positive.order=TRUE,
       box.width=unit(.4,"cm"),
       between=list(y=0),
       strip=FALSE, strip.left=strip.custom(bg="gray97"),
       par.strip.text=list(cex=.6, lines=5),
       main="Is your job professionally challenging?",
       rightAxis=TRUE,  ## display Row Count Totals
       ylab=NULL,
       sub="This looks better in a 10inx7in window")
ProfChalCountsPlot


## Not run: 
##D ## 2. Plot percents with rows in each panel sorted by positive percents.
##D ##    This is a different sequence than the counts.  Row Count Totals are
##D ##    displayed on the right axis.
##D ProfChalPctPlot <-
##D likert(Question ~ . | Subtable, ProfChal,
##D        as.percent=TRUE,    ## implies display Row Count Totals
##D        scales=list(y=list(relation="free")), layout=c(1,6),
##D        positive.order=TRUE,
##D        box.width=unit(.4,"cm"),
##D        between=list(y=0),
##D        strip=FALSE, strip.left=strip.custom(bg="gray97"),
##D        par.strip.text=list(cex=.6, lines=5),
##D        main="Is your job professionally challenging?",
##D        rightAxis=TRUE,  ## display Row Count Totals
##D        ylab=NULL,
##D        sub="This looks better in a 10inx7in window")
##D ProfChalPctPlot
##D 
##D ## 3. Putting both percents and counts on the same plot, both in
##D ##    the order of the positive percents.
##D 
##D LikertPercentCountColumns(Question ~ . | Subtable, ProfChal,
##D                           layout=c(1,6), scales=list(y=list(relation="free")),
##D                           ylab=NULL, between=list(y=0),
##D                           strip.left=strip.custom(bg="gray97"), strip=FALSE,
##D                           par.strip.text=list(cex=.7),
##D                           positive.order=TRUE,
##D                           main="Is your job professionally challenging?")
##D 
##D 
##D ## Restore original name
##D ## levels(ProfChal$Subtable)[6] <- "Attitude\ntoward\nProfessional\nRecognition"
## End(Not run)

## Not run: 
##D ## 4. All possible forms of formula for the likert formula method:
##D data(ProfChal)
##D row.names(ProfChal) <- abbreviate(ProfChal$Question, 8)
##D 
##D likert( Question ~ . | Subtable,
##D        data=ProfChal, scales=list(y=list(relation="free")), layout=c(1,6))
##D 
##D likert( Question ~
##D           "Strongly Disagree" + Disagree + "No Opinion" + Agree + "Strongly Agree" | Subtable,
##D        data=ProfChal, scales=list(y=list(relation="free")), layout=c(1,6))
##D 
##D likert( Question ~ . ,
##D        data=ProfChal)
##D 
##D likert( Question ~ "Strongly Disagree" + Disagree + "No Opinion" + Agree + "Strongly Agree",
##D        data=ProfChal)
##D 
##D likert( ~ . | Subtable,
##D        data=ProfChal, scales=list(y=list(relation="free")), layout=c(1,6))
##D 
##D likert( ~ "Strongly Disagree" + Disagree + "No Opinion" + Agree + "Strongly Agree" | Subtable,
##D        data=ProfChal, scales=list(y=list(relation="free")), layout=c(1,6))
##D 
##D likert( ~ . ,
##D        data=ProfChal)
##D 
##D likert( ~ "Strongly Disagree" + Disagree + "No Opinion" + Agree + "Strongly Agree",
##D        data=ProfChal)
##D 
## End(Not run)

## Not run: 
##D ## 5. putting the x-axis tick labels on top for horizontal plots
##D ##    putting the y-axis tick lables on right for vertical plots
##D ##
##D ## This non-standard specification is a consequence of using the right
##D ## axis labels for different values than appear on the left axis labels
##D ## with horizontal plots, and using the top axis labels for different
##D ## values than appear on the bottom axis labels with vertical plots.
##D 
##D ## Percent plot calculated automatically from Count data
##D 
##D tmph <-
##D likert(Question ~ . , ProfChal[ProfChal$Subtable=="Employment sector",],
##D        as.percent=TRUE,
##D        main='Is your job professionally challenging?',
##D        ylab=NULL,
##D        sub="This plot looks better in a 9in x 4in window.")
##D tmph$x.scales$labels
##D names(tmph$x.scales$labels) <- tmph$x.scales$labels
##D update(tmph, scales=list(x=list(alternating=2)), xlab=NULL, xlab.top="Percent")
##D 
##D tmpv <-
##D likert(Question ~ . , ProfChal[ProfChal$Subtable=="Employment sector",],
##D        as.percent=TRUE,
##D        main='Is your job professionally challenging?',
##D        sub="likert plots with long Question names look better horizontally.
##D With effort they can be made to look adequate vertically.",
##D        horizontal=FALSE,
##D        scales=list(y=list(alternating=2), x=list(rot=c(90, 0))),
##D        ylab.right="Percent",
##D        ylab=NULL,
##D        xlab.top="Column Count Totals",
##D        par.settings=list(
##D          layout.heights=list(key.axis.padding=5),
##D          layout.widths=list(key.right=1.5, right.padding=0))
##D )
##D tmpv$y.scales$labels
##D names(tmpv$y.scales$labels) <- tmpv$y.scales$labels
##D tmpv
##D tmpv$x.limits <- abbreviate(tmpv$x.limits,8)
##D tmpv$x.scales$rot=c(0, 0)
##D tmpv
##D 
## End(Not run)

## Not run: 
##D ## illustration that a border on the bars is misleading when it splits a bar.
##D tmp <- data.frame(a=1, b=2, c=3)
##D likert(~ . , data=tmp, ReferenceZero=2, main="No border. OK.")
##D likert(~ . , data=tmp, ReferenceZero=2, border="white",
##D        main="Border. Misleading split of central bar.")
##D likert(~ . , data=tmp, ReferenceZero=2.5, main="No border. OK.")
##D likert(~ . , data=tmp, ReferenceZero=2.5, border="white", main="Border. OK.")
## End(Not run)

## Not run: 
##D   ## run the shiny app
##D   shiny::runApp(system.file("shiny/likert", package="HH"))
## End(Not run)

## The ProfChal data is done again with explicit use of ResizeEtc
## in ?HH:::ResizeEtc




