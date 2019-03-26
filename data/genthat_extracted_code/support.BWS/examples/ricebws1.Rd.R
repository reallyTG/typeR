library(support.BWS)


### Name: ricebws1
### Title: Consumers' preferences for rice characteristics
### Aliases: ricebws1
### Keywords: datasets

### ** Examples

# Respondents were asked to select their most and least important
# characteristics of rice when purchasing rice. Rice characteristics
# were assumed to be place of origin, variety, price, taste, safety,
# wash-free rice, and milling date. BWS questions were created from
# a balanced incomplete block design (BIBD) with seven treatments
# (items), four columns (four items per question), and seven rows
# (seven questions).

# Generate the BIBD using find.BIB() in the crossdes package:
require("crossdes")
set.seed(8041)
bibd.ricebws1 <- find.BIB(trt = 7, b = 7, k = 4)
isGYD(bibd.ricebws1)
bibd.ricebws1

# Store rice characteristics used in the survey to items.ricebws1:
items.ricebws1 <- c(
  "Place_of_origin",
  "Variety",
  "Price",
  "Taste",
  "Safety",
  "Washfree_rice",
  "Milling_date")

# Convert the BIBD into the BWS questions:
bws.questionnaire(bibd.ricebws1, design.type = 2,
  item.names = items.ricebws1)

# Load the dataset ricebws1 containing the responses to 
# the BWS questions:
data("ricebws1", package = "support.BWS")
dim(ricebws1)
names(ricebws1)

# Create the dataset for the analysis:
data.ricebws1 <- bws.dataset(
  respondent.dataset = ricebws1,
  response.type = 1,
  choice.sets = bibd.ricebws1,
  design.type = 2,
  item.names = items.ricebws1)

# Calculate BW scores:
count.ricebws1 <- bws.count(data = data.ricebws1)
count.ricebws1



