library(reader)


### Name: find.id.col
### Title: Find which column in a dataframe contains a specified set of
###   values.
### Aliases: find.id.col

### ** Examples

new.frame <- data.frame(day=c("M","T","W"),time=c(9,12,3),staff=c("Mary","Jane","John"))
staff.ids <- c("Mark","Jane","John","Andrew","Sally","Mary")
new.frame; staff.ids; find.id.col(new.frame,staff.ids)



