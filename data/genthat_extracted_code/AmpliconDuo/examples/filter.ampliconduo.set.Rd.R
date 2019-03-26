library(AmpliconDuo)


### Name: filter.ampliconduo.set
### Title: AmpliconDuo List Amplicon Filter
### Aliases: filter.ampliconduo.set
### Keywords: manip

### ** Examples

## load example data
data(amplicons)

## apply filter criteria
ampliconduos.f <- filter.ampliconduo.set(amplicons)
ampliconduos.f <- filter.ampliconduo.set(amplicons, min.freq = 3, remove = TRUE)

## to return a list with the indices (corresponding to the indices of the data 
## the ampliconduo function was called on) of all amplicons that passed the filter criteria 
good.reads <- accepted.amplicons(ampliconduos.f)



