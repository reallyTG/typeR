library(support.CEs)


### Name: make.dataset
### Title: Making a data set
### Aliases: make.dataset
### Keywords: datasets survival

### ** Examples

library(survival)
library(stats)

# Case 1
# Choice experiments using the function rotaion.design.
# See "Details" for the data set syn.res1.

des1 <- rotation.design(
 attribute.names = list(
  Region = c("Reg_A", "Reg_B", "Reg_C"), 
  Eco = c("Conv.", "More", "Most"), 
  Price = c("1", "1.1", "1.2")), 
 nalternatives = 2,
 nblocks = 1,
 row.renames = FALSE, 
 randomize = TRUE,
 seed = 987)
des1
questionnaire(choice.experiment.design = des1)
desmat1 <- make.design.matrix(
 choice.experiment.design = des1, 
 optout = TRUE, 
 categorical.attributes = c("Region", "Eco"), 
 continuous.attributes = c("Price"),
 unlabeled = TRUE)
data(syn.res1)
dataset1 <- make.dataset(
 respondent.dataset = syn.res1, 
 choice.indicators = 
  c("q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9"), 
 design.matrix = desmat1)
clogout1 <- clogit(RES ~ ASC + Reg_B + Reg_C + More + Most + 
 More:F + Most:F + Price + strata(STR), data = dataset1)
clogout1
gofm(clogout1)
mwtp(
 output = clogout1,
 monetary.variables = c("Price"), 
 nonmonetary.variables = 
  c("Reg_B", "Reg_C", "More", "Most", "More:F", "Most:F"), 
 seed = 987)

# Case 2
# Choice experiments using the function Lma.design.
# See "Details" for the data set syn.res2.

des2 <- Lma.design(
 attribute.names = list(
  Eco = c("Conv.", "More", "Most"), 
  Price = c("1", "1.1", "1.2")), 
 nalternatives = 3,
 nblocks = 2,
 row.renames = FALSE,
 seed = 987)
des2
questionnaire(choice.experiment.design = des2, quote = FALSE)
desmat2 <- make.design.matrix(
 choice.experiment.design = des2, 
 optout = TRUE, 
 categorical.attributes = c("Eco"), 
 continuous.attributes = c("Price"), 
 unlabeled = FALSE)
data(syn.res2)
dataset2 <- make.dataset(
 respondent.dataset = syn.res2, 
 choice.indicators = 
  c("q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9"), 
 design.matrix = desmat2)
clogout2 <- clogit(RES ~ ASC1 + More1 + Most1 + Price1 + 
 ASC2 + More2 + Most2 + Price2 + ASC3 + More3 + Most3 + Price3 + 
 strata(STR), data = dataset2)
clogout2
gofm(clogout2)
mwtp(
 output = clogout2, 
 monetary.variables = c("Price1", "Price2", "Price3"), 
 nonmonetary.variables = list(
  c("More1", "Most1"), c("More2", "Most2"), c("More3", "Most3")), 
 seed = 987)

# Case 3
# Binary choice experiments using the function Lma.design.
# See "Details" for the data set syn.res3.

des3 <- Lma.design(
 attribute.names = list(
  Region = c("Reg_A", "Reg_B", "Reg_C"),
  Eco = c("Conv.", "More", "Most"),
  Price = c("1", "1.1", "1.2")),
 nalternatives = 1,
 nblocks = 1,
 row.renames = FALSE,
 seed = 987)
des3
questionnaire(choice.experiment.design = des3, quote = FALSE)
desmat3 <- make.design.matrix(
 choice.experiment.design = des3,
 optout = TRUE,
 categorical.attributes = c("Region", "Eco"),
 continuous.attributes = c("Price"),
 unlabeled = TRUE,
 common = NULL,
 binary = TRUE)
data(syn.res3)
dataset3 <- make.dataset(
 respondent.dataset = syn.res3,
 choice.indicators = 
  c("q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q9"),
 design.matrix = desmat3)
blout <- glm(RES ~ Reg_B + Reg_C + More + Most + Price,
 family = binomial(link = logit), data = dataset3)
summary(blout)
gofm(blout)
mwtp(output = blout,
 monetary.variables = c("Price"),
 nonmonetary.variables = 
  c("Reg_B", "Reg_C", "More", "Most"),
 seed = 987)




