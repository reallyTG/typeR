library(PopGenReport)


### Name: popgenreport
### Title: This is the main function of the package. It analyses an object
###   of class 'genind' and then creates a report containing the results of
###   the analysis. There are several routines that can be optionally
###   included in the analysis and there are multiple output options
###   including a PDF with the report, R-code and an object
###   ('fname.results') containing all of the results, which can be used
###   for further analyses.
### Aliases: popgenreport

### ** Examples


#not run:
#data(bilby) # a generated data set
#res <- popgenreport(bilby, mk.counts=TRUE, mk.map=TRUE, mk.pdf=FALSE)
#check results via res or use created tables in the results folder.

### RUN ONLY with a working Latex version installed
# res <- popgenreport(bilby, mk.counts=TRUE, mk.map=TRUE, mk.pdf=TRUE, path.pgr="c:/temp")
# for a full report in a single pdf set mk.complete to TRUE
# res <- popgenreport(bilby, mk.complete=TRUE)



