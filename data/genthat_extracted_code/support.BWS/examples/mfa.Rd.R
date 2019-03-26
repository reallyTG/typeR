library(support.BWS)


### Name: mfa
### Title: Synthetic respondent data set: citizens' preferences for the
###   multifunctionality of agriculture
### Aliases: mfa
### Keywords: datasets

### ** Examples

# The following OA is generated using oa.design()
# in the DoE.base package:
#  set.seed(123)
#  oa.design(nfactors = 9, nlevels = 2)
sets.mfa <- cbind(
  c(1,2,1,2,2,1,2,2,1,1,1,2),
  c(2,1,2,1,2,1,2,2,1,1,2,1),
  c(1,2,1,1,2,1,2,1,2,2,2,1),
  c(1,2,2,2,1,2,2,1,1,1,2,1),
  c(2,2,2,1,1,1,2,1,2,1,1,2),
  c(1,1,2,2,1,1,2,2,2,2,1,1),
  c(2,1,1,2,2,2,2,1,2,1,1,1),
  c(2,1,1,2,1,1,2,1,1,2,2,2),
  c(2,2,1,1,1,2,2,2,1,2,1,1))
items.mfa <- c(
  "Landscape",
  "Biodiversity",
  "Water use",
  "Land conservation",
  "Flood control",
  "Rural viability",
  "Food security",
  "Animal welfare",
  "Cultural heritage")
bws.questionnaire(
  choice.sets = sets.mfa,
  design.type = 1,
  item.names = items.mfa)
data(mfa)
data.mfa <- bws.dataset(
  respondent.dataset = mfa,
  response.type = 1,
  choice.sets = sets.mfa,
  design.type = 1,
  item.names = items.mfa)
count.mfa <- bws.count(data = data.mfa)
count.mfa



