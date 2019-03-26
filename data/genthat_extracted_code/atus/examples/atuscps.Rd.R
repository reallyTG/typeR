library(atus)


### Name: atuscps
### Title: Current Population Survey for ATUS Households (2003-2016)
### Aliases: atuscps
### Keywords: datasets

### ** Examples

data(atuscps)

# distribution of households across regions of the U.S.
# note that stratified sampling was done
barplot(table(atuscps$region))

barplot(table(atuscps$race), horiz=TRUE, las=1)

hist(atuscps$age)



