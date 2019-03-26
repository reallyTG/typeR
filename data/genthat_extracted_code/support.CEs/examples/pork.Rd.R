library(support.CEs)


### Name: pork
### Title: Synthetic respondent data set: consumers' valuation of pork
### Aliases: pork
### Keywords: datasets

### ** Examples

library(survival)

d.pork <- Lma.design(
  attribute.names = list(
    Price = c("100", "130", "160", "190")),
  nalternatives = 3,
  nblocks = 4,
  row.renames = FALSE,
  seed = 987)

data(pork)

dm.pork <- make.design.matrix(
  choice.experiment.design = d.pork,
  optout = TRUE,
  continuous.attributes = c("Price"),
  unlabeled = FALSE)

ds.pork <- make.dataset(
  respondent.dataset = pork,
  choice.indicators =
    c("q1", "q2", "q3", "q4"),
  design.matrix = dm.pork)

fm.pork <- RES ~ ASC1 + Price1 +
                 ASC2 + Price2 +
                 ASC3 + Price3 +
                 strata(STR)
out.pork <- clogit(fm.pork, data = ds.pork)
out.pork



