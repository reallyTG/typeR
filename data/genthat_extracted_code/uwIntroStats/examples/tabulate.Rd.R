library(uwIntroStats)


### Name: tabulate
### Title: Table Variables, with Stratification and Statistical Tests
### Aliases: tabulate tabulate.do print.tabulate tabulate.default tabModel
### Keywords: ~kwd1 ~kwd2

### ** Examples

## load the necessary libraries
library(survival)
library(Exact)
library(plyr)

## read in the mri dataset 
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt",header=TRUE)

## attach the mri dataset
attach(mri)

## create a table of stroke and race
tabulate(stroke, race)

## perform a chi-squared test of stroke vs race, display the count, row percentage, 
## and column percentage
tabulate(stroke, race, stat="@count@ @row%@ @col%@")

## perform chi-squared test, likelihood ratio test, and fisher's exact test 
## for stroke vs race
tabulate(stroke, race, tests=c("lrchisq", "fisher"))

## for diabetes vs male by race, perform chi-squared test, display 
## odds ratio/risk ratio, mantel-haenzsel, likelihood ratio chi-squared
tabulate(diabetes, male, race, dispRatios=TRUE, tests=c("lrchisq", "mh"))



