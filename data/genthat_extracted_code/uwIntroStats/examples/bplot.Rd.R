library(uwIntroStats)


### Name: bplot
### Title: Boxplot with Lowess Curves, Jittered Data, Overlaid Mean and
###   Standard Deviation, for an Arbitrary Number of Strata
### Aliases: bplot
### Keywords: ~kwd1 ~kwd2

### ** Examples

#- Read in and attach the data -#
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt", header=TRUE)
attach(mri)

#- Produce box plot with jittered data, sample mean, and sd -#
bplot(y=atrophy, x=male, xlab="Gender", ylab="Atrophy")



