library(support.BWS2)


### Name: agritourism
### Title: Potential tourists' valuation of agritourism
### Aliases: agritourism
### Keywords: datasets

### ** Examples

## Not run: 
##D # Agritourism refers to various activities offered by farms and ranches
##D # to visitors, such as hands-on farm work or outdoor recreation.
##D #
##D # In the Case 2 BWS questions, respondents were asked to evaluate 
##D # agritourism packages provided by dairy farms (ranches) in Hokkaido, Japan. 
##D # We assumed that the agritourism package consists of the following four
##D # types of activities, each with three activity items:
##D #  1. Hands-on ranch chores
##D #    (1) Milking a cow
##D #    (2) Feeding a cow
##D #    (3) Nursing a calf
##D #  2. Hands-on food processing
##D #    (1) Butter making
##D #    (2) Ice-cream making
##D #    (3) Creamy caramel making
##D #  3. Hands-on craft making
##D #    (1) Making a product from wool
##D #    (2) Making a product from wood
##D #    (3) Making a product from pressed flowers
##D #  4. Outdoor activities
##D #    (1) Horse riding
##D #    (2) Tractor riding
##D #    (3) Walking with cows
##D #
##D # As there are four activities and each activity has three items, 
##D # a total of nine BWS questions were created using a three-level OMED
##D # with four columns. Each BWS question asked respondents to select
##D # the most and least interesting of the four activities shown 
##D # in the question.
##D #
##D # In the following, we assume that the paired and marginal models with
##D # both attribute and attribute-level variables (Flynn et al. 2007; 2008)
##D # are fitted to the responses using the conditional logit model, 
##D # with clogit() in the survival package.
##D 
##D # Load the package needed for the example:
##D require(survival)
##D 
##D options(digits = 4)
##D 
##D # The following OMED is generated using oa.design() in the DoE.base package:
##D # require(DoE.base)
##D # des <- data.matrix(
##D #    oa.design(nl = c(3,3,3,3), randomize = FALSE))
##D des <- cbind(
##D   c(1, 1, 1, 2, 2, 2, 3, 3, 3),
##D   c(1, 2, 3, 1, 2, 3, 1, 2, 3),
##D   c(1, 3, 2, 3, 2, 1, 2, 1, 3),
##D   c(1, 2, 3, 3, 1, 2, 2, 3, 1))
##D 
##D # The names of the attributes (activities) and attribute levels 
##D # (activity items) were stored in the list attr.lev:
##D attr.lev <- list(
##D   chore = c("milking", "feeding", "nursing"),
##D   food = c("butter", "ice", "caramel"),
##D   craft = c("wool", "wood", "flower"),
##D   outdoor = c("horse", "tractor", "cow"))
##D 
##D # A series of Case 2 BWS questions were converted from the OMED using 
##D # bws2.questionnaire():
##D bws2.questionnaire(choice.sets = des, attribute.levels = attr.lev,
##D   position = "left")
##D 
##D # The responses to the questions were stored in the dataset agritourism
##D # in the support.BWS2 package:
##D data(agritourism)
##D dim(agritourism)
##D colnames(agritourism)
##D 
##D # The names of the response variables used in the dataset agritourism
##D # were stored in the vector response.vars:
##D response.vars <- colnames(agritourism)[2:19]
##D response.vars
##D 
##D # The base level in each attribute was stored in the object base.lev
##D # in list format:
##D base.lev <- list(
##D   chore = c("nursing"),
##D   food = c("caramel"),
##D   craft = c("flower"),
##D   outdoor = c("cow"))
##D 
##D # The datasets for the paired model and the marginal model were created
##D # using bws2.dataset() and then stored in the objects pr.data1 and mr.data1,
##D # respectively:
##D pr.data1 <- bws2.dataset(
##D   data = agritourism,
##D   id = "id",
##D   response = response.vars,  
##D   choice.sets = des,        
##D   attribute.levels = attr.lev,
##D   reverse = TRUE,
##D   base.level = base.lev,
##D   type = "paired") 
##D mr.data1 <- bws2.dataset(
##D   data = agritourism,
##D   id = "id",
##D   response = response.vars,
##D   choice.sets = des,
##D   attribute.levels = attr.lev,
##D   reverse = TRUE,
##D   base.level = base.lev,
##D   type = "marginal")
##D dim(pr.data1)
##D names(pr.data1)
##D dim(mr.data1)
##D names(mr.data1)
##D 
##D # The BWS scores were calculated using bws2.count() with the dataset for
##D # the marginal model:
##D scores <- bws2.count(mr.data1)
##D dim(scores)
##D names(scores)
##D 
##D # The scores for each level were aggregated among all respondents using
##D # sum() and bar plots of the scores were drawn using barplot():
##D sum(scores, "level")
##D barplot(scores, "bw", "level")
##D 
##D # If we only need aggregated B and W scores, these can be calculated from
##D # the dataset for a paired model as follows:
##D apply(pr.data1[pr.data1$RES == 1, c("BEST.LV", "WORST.LV")], 2, table)
##D 
##D # BW scores can be calculated according to groups of respondents. 
##D # For example, the scores for male and those for female are given as follows:
##D sum(scores[agritourism$gender == 1, ], "level")
##D sum(scores[agritourism$gender == 2, ], "level")
##D 
##D # Bar plots for respondents in their 20s and those in their 50s can also be
##D # drawn using the following lines of code:
##D barplot(scores[agritourism$age == 2, ], "bw", "level")
##D barplot(scores[agritourism$age == 5, ], "bw", "level")
##D 
##D # We fitted the conditional logit model to the Case 2 BWS responses 
##D # on the basis of the paired and marginal models with both attribute
##D # and attribute-level variables. The systematic component of the utility
##D # function for the example is
##D #    v = b1 chore + b2 food + b3 outdoor + 
##D #        b4 milking + b5 feeding + b6 butter + b7 ice +
##D #        b8 wool + b9 wood + b10 horse + b11 tractor
##D # where chore, food, and outdoor are attribute variables (craft has been
##D # omitted); and milking, feeding, butter, ice, wool, wood, horse, and
##D # tractor are attribute-level variables (nursing has been omitted for chore,
##D # caramel has been omitted for food, flower has been omitted for craft,
##D # and cow has been omitted for outdoor); bs are coefficients to be estimated.
##D #
##D # The model formula for clogit(), corresponding to the systematic component
##D # mentioned above, is described as:
##D mf <- RES ~ chore + food + outdoor + 
##D             milking + feeding + butter + ice + 
##D             wool + wood + horse + tractor +
##D             strata(STR)
##D 
##D # We fitted the paired model using clogit() with the dataset pr.data1:
##D pr.out <- clogit(formula = mf, data = pr.data1)
##D pr.out
##D 
##D # The attribute-level variables are effect-coded ones, and thus the 
##D # coefficient of the base level in each attribute can be calculated using:
##D b <- coef(pr.out)
##D (nursing <- -sum(b[4:5]))
##D names(nursing) <- "nursing"
##D (caramel <- -sum(b[6:7]))
##D names(caramel) <- "caramel"
##D (flower <- -sum(b[8:9]))
##D names(flower) <- "flower"
##D (cow <- -sum(b[10:11]))
##D names(cow) <- "cow"
##D craft <- 0
##D names(craft) <- "craft"
##D paired.model <- c(b[1:2], craft, b[3], b[4:5], nursing, b[6:7],
##D   caramel, b[8:9], flower, b[10:11], cow)
##D barplot(paired.model)
##D 
##D # The following code is for the marginal model: 
##D mr.out <- clogit(formula = mf, data = mr.data1)
##D mr.out
##D b <- coef(mr.out)
##D (nursing <- -sum(b[4:5]))
##D names(nursing) <- "nursing"
##D (caramel <- -sum(b[6:7]))
##D names(caramel) <- "caramel"
##D (flower <- -sum(b[8:9]))
##D names(flower) <- "flower"
##D (cow <- -sum(b[10:11]))
##D names(cow) <- "cow"
##D marginal.model <- c(b[1:2], craft, b[3], b[4:5], nursing, b[6:7],
##D   caramel, b[8:9], flower, b[10:11], cow)
##D barplot(marginal.model)
##D 
##D # As mentioned in Flynn et al. (2008), the results from the paired model
##D # are similar to those from the marginal model: the correlation coefficient
##D # for the two results is calculated as follows:
##D cor(marginal.model, paired.model)
##D plot(marginal.model, paired.model, 
##D   xlim = c(-0.5, 1), ylim = c(-0.5, 1))
## End(Not run)



