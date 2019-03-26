library(eeptools)


### Name: crosstabplot
### Title: Draw a visual crosstab (mosaic plot) with shading for
###   correlations and labels in each cell.
### Aliases: crosstabplot
### Keywords: crosstabs mosaic vcd

### ** Examples

df <- data.frame(cbind(x=seq(1,3,by=1), y=sample(LETTERS[6:8],60,replace=TRUE)),
fac=sample(LETTERS[1:4], 60, replace=TRUE))
varnames<-c('Quality','Grade')
myCT <- crosstabs(df, rowvar = "x",colvar = "fac", varnames = varnames, digits =2)
crosstabplot(df, rowvar = "x",colvar = "fac", varnames = varnames, 
title = 'My Plot', subtitle = 'Foo', label = FALSE, shade = TRUE, digits = 3)



