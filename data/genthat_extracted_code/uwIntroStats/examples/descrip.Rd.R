library(uwIntroStats)


### Name: descrip
### Title: Descriptive Statistics
### Aliases: descrip ifelse1 print.uDescriptives
### Keywords: ~kwd1 ~kwd2

### ** Examples

#- Load the data -#
#- Read in and attach the data -#
mri <- read.table("http://www.emersonstatistics.com/datasets/mri.txt", header=TRUE)
attach(mri)

#- Load libraries -#
library(survival)

#- Create the table -#
descrip(mri)



