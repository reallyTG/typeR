library(dmm)


### Name: harv101.df
### Title: Harvey dataset
### Aliases: harv101.df
### Keywords: datasets

### ** Examples

library(dmm)
data(harv101.df)
str(harv101.df)
# preprocess, keeping Weight and Adg for use as covariates
# we need the keep=T agrument to preserve the covariates
harv.mdf <- mdf(harv101.df, pedcols=c(1:3), factorcols=c(4,5,9), ycols=3, 
            keep=TRUE, sexcode=c(1,2))
str(harv.mdf)
#cleanup
rm(harv101.df)
rm(harv.mdf)
#
# There is a full analysis of this dataset in 'dmmOverview.pdf'.
#



