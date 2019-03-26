library(support.BWS)


### Name: fruit
### Title: Synthetic respondent data set: consumers' preferences for fruits
### Aliases: fruit
### Keywords: datasets

### ** Examples

# The following BIBD is generated using find.BIB()
# in the crossdes package:
#  set.seed(123)
#  find.BIB(trt = 7, k = 4, b = 7)
sets.fruit <- cbind(
  c(1,2,2,1,1,3,1),
  c(4,3,4,2,3,5,2),
  c(6,4,5,5,4,6,3),
  c(7,6,7,6,5,7,7)) 
items.fruit <- c(
  "Apple",
  "Orange",
  "Grapes",
  "Banana",
  "Peach",
  "Melon",
  "Pear")
bws.questionnaire(
  choice.sets = sets.fruit,
  design.type = 2,
  item.names = items.fruit)
data(fruit)
data.fruit <- bws.dataset(
  respondent.dataset = fruit,
  response.type = 1,
  choice.sets = sets.fruit,
  design.type = 2,
  item.names = items.fruit)
count.fruit <- bws.count(data = data.fruit)
count.fruit



