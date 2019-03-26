library(support.CEs)


### Name: rice
### Title: Synthetic respondent data set: consumers' valuation of rice
### Aliases: rice
### Keywords: datasets

### ** Examples

library(survival)

d.rice <- rotation.design(
  attribute.names = list(
    Region = c("RegA", "RegB", "RegC"),
    Cultivation = c("Conv", "NoChem", "Organic"),
    Price = c("1700", "2000", "2300")),
  nalternatives = 2,
  nblocks = 1,
  row.renames = FALSE,
  randomize = TRUE,
  seed = 987)

data(rice)

dm.rice <- make.design.matrix(
  choice.experiment.design = d.rice,
  optout = TRUE,
  categorical.attributes = c("Region", "Cultivation"),
  continuous.attributes = c("Price"),
  unlabeled = TRUE)

ds.rice <- make.dataset(
  respondent.dataset = rice,
  choice.indicators =
    c("q1", "q2", "q3", "q4", "q5",
      "q6", "q7", "q8", "q9"),
  design.matrix = dm.rice)

fm.rice <- RES ~ ASC + RegB + RegC + NoChem + Organic +
           NoChem:F + Organic:F + Price + strata(STR)
out.rice <- clogit(fm.rice, data = ds.rice)
out.rice



