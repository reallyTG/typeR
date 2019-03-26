library(uwIntroStats)


### Name: scatter
### Title: Scatter Plot with Lowess Curves
### Aliases: scatter
### Keywords: ~kwd1 ~kwd2

### ** Examples

#- Read in and attach the data -#
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt", header=TRUE)
attach(mri)

#- Create a scatterplot with lowess curves and least squares fitted regression lines -#
scatter(atrophy, age, ylab="Atrophy", xlab="Age")

#- Create a scatterplot stratified by age on the log scale with lowess curves and -#
#- least squares fitted regression lines -#
scatter(atrophy, age, strata=male,ylab="Atrophy", xlab="Age",log="y")



