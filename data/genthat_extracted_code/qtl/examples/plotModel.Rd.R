library(qtl)


### Name: plotModel
### Title: Plot a QTL model
### Aliases: plotModel
### Keywords: hplot

### ** Examples

# plot a QTL model, using a vector of character strings to define the QTL
plotModel(c("1","4","6","15"), formula=y~Q1+Q2+Q3*Q4)

# plot an additive QTL model
data(hyper)
hyper <- calc.genoprob(hyper)
qtl <- makeqtl(hyper, chr=c(1,4,6,15), pos=c(68.3,30,60,18), what="prob")
plotModel(qtl)

# include an interaction
plotModel(qtl, formula=y~Q1+Q2+Q3*Q4)

# alternatively, include the formula as an attribute to the QTL object
attr(qtl, "formula") <- y~Q1+Q2+Q3*Q4
plotModel(qtl)

# if formula given, the attribute within the object is ignored
plotModel(qtl, y~Q1+Q2+Q3+Q4)

# NULL formula indicates additive QTL model
plotModel(qtl, NULL)

# reorder the QTL in the figure
plotModel(qtl, order=c(1,3,4,2))

# show just the chromosome numbers
plotModel(qtl, chronly=TRUE)



