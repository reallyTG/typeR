library(support.CEs)


### Name: rural
### Title: Synthetic respondent data set: residents' valuation of rural
###   environment conservation plan
### Aliases: rural
### Keywords: datasets

### ** Examples

library(stats)

d.rural <- Lma.design(
  attribute.names = list(
    Area = c("20", "40", "60", "80"),
    Facility = c("None", "Agr", "Env", "Rec"),
    Tax = c("1000", "3000", "5000", "7000")),
  nalternatives = 1,
  nblocks = 4,
  row.renames = FALSE,
  seed = 987)

common.alt <- c(Area = "0", Facility = "None", Tax = "0")

dm.rural <- make.design.matrix(
  choice.experiment.design = d.rural,
  optout = FALSE,
  categorical.attributes = c("Facility"),
  continuous.attributes = c("Area", "Tax"),
  unlabeled = TRUE,
  common = common.alt,
  binary = TRUE)

data(rural)
rural1 <- subset(rural, Region == 1)
rural2 <- subset(rural, Region == 2)

ds.rural1 <- make.dataset(
  respondent.dataset = rural1,
  choice.indicators =
    c("q1", "q2", "q3", "q4"),
  design.matrix = dm.rural,
  detail = FALSE)

ds.rural2 <- make.dataset(
  respondent.dataset = rural2,
  choice.indicators =
    c("q1", "q2", "q3", "q4"),
  design.matrix = dm.rural,
  detail = FALSE)

fm.rural <- RES ~ Agr + Env + Rec + Area + Tax

out.rural1 <- glm(fm.rural,
                  family = binomial(link = "logit"),
                  data = ds.rural1)
summary(out.rural1)

out.rural2 <- glm(fm.rural,
                  family = binomial(link = "logit"),
                  data = ds.rural2)
summary(out.rural2)



