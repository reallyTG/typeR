library(RDS)


### Name: get.number.of.recruits
### Title: Calculates the number of (direct) recuits for each respondent.
### Aliases: get.number.of.recruits

### ** Examples

data(fauxmadrona)
nr <- get.number.of.recruits(fauxmadrona)
#frequency of number recruited by each id
barplot(table(nr))



