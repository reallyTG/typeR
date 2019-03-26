library(AmpliconDuo)


### Name: accepted.amplicons
### Title: List Of Amplicon Indices That Passed Filter Criteria
### Aliases: accepted.amplicons
### Keywords: list

### ** Examples

## load example data
data(amplicons)

## apply filter criteria
ampliconduos.f <- filter.ampliconduo.set(amplicons, q = 0.05)

## return a list with accepted amplicons
good.reads <- accepted.amplicons(ampliconduos.f)



