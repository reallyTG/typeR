library(mdmb)


### Name: offset_values_extract
### Title: Extracts Offset Values
### Aliases: offset_values_extract

### ** Examples

#############################################################################
# EXAMPLE 1: Toy example for extraction of offset values
#############################################################################

data(data.ma01, package="miceadds")
dat <- data.ma01

dat1 <- mdmb::offset_values_extract( formula=~ migrant + offset(books), data=dat )
dat1[1:5]
  ##  [1] 6 6 5 2 6



