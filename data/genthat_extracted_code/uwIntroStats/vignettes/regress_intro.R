## ------------------------------------------------------------------------
## Preparing our R session
library(uwIntroStats)
data(mri)

## ------------------------------------------------------------------------
regress("mean", atrophy ~ age + male, data = mri)

## ------------------------------------------------------------------------
regress("odds", diabetes ~ male, data = mri)

## ------------------------------------------------------------------------
salary <- read.table("http://www.emersonstatistics.com/datasets/salary.txt", header = TRUE, stringsAsFactors = FALSE)

## create an indicator variable
salary$female <- ifelse(salary$sex == "F", 1, 0)

## ------------------------------------------------------------------------
## linear regression
regress("mean", salary ~ female*year, data = salary)

## ------------------------------------------------------------------------
## GEE
regress("mean", salary ~ female*year, id = id, data = salary)

## ------------------------------------------------------------------------
regress("odds", diabetes ~ dummy(race), data = mri)

## ------------------------------------------------------------------------
regress("mean", atrophy ~ U(ma = ~male*age) + U(mr = ~male*dummy(race)), data = mri)

