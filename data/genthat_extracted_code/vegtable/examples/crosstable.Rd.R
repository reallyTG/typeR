library(vegtable)


### Name: crosstable
### Title: Generating cross tables from database lists.
### Aliases: crosstable crosstable,formula,data.frame-method
###   crosstable,formula,vegtable-method cross2db
### Keywords: methods

### ** Examples

library(vegtable)

## load Kenya_veg and subset to reference 2331 (Bronner 1990)
data(Kenya_veg)
Kenya_veg <- subset(Kenya_veg, REFERENCE == 2331, slot="header")

## transform cover to percentage
Kenya_veg <- transform(Kenya_veg, to="cover_perc", rule="middle")

## cross table of the first 5 plots
Cross <- crosstable(cover_perc ~ ReleveID + AcceptedName + AuthorName,
        Kenya_veg[1:5,], mean, na_to_zero=TRUE)
head(Cross)



