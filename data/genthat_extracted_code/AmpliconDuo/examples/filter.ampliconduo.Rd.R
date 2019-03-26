library(AmpliconDuo)


### Name: filter.ampliconduo
### Title: AmpliconDuo Amplicon Filter
### Aliases: filter.ampliconduo
### Keywords: manip

### ** Examples

##load example data
data(amplicons)

## extract the first ampliconduo data frame
ampliconduo1 <- amplicons[[1]]

## apply filter criteria 
ampliconduo1.f <- filter.ampliconduo(ampliconduo1)
ampliconduo1.f <- filter.ampliconduo(ampliconduo1, min.freq = 2, remove = TRUE)

## to return a list with the indices (corresponding to the indices of the data 
## the ampliconduo function was called on) of all amplicons that passed the filter criteria 
good.reads <- accepted.amplicons(ampliconduo1.f)




