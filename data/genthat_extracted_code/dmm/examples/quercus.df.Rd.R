library(dmm)


### Name: quercus.df
### Title: Quercus example dataset
### Aliases: quercus.df
### Keywords: datasets

### ** Examples

library(dmm)
data(quercus.df)
str(quercus.df)
# preprocess
quercus.mdf <- mdf(quercus.df,pedcols=c(1:3),factorcols=4,ycols=c(5:6),
               relmat=c("E","A","D"),sexcode=c(1,2))
str(quercus.mdf)
# cleanup
rm(quercus.df)
rm(quercus.mdf)
#
# there is a full analysis of this dataset in 'dmmOverview.pdf'.
#



