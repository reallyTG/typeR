library(support.BWS)


### Name: bws.dataset
### Title: Creating a data set suitable for BWS analysis on the basis of
###   counting and modeling approaches
### Aliases: bws.dataset
### Keywords: manip

### ** Examples

## load packages
require(DoE.base) # include oa.design() used to generate a two-level OMED
require(crossdes) # include find.BIB() used to generate a BIBD
require(survival) # include clogit() used to analyze responses

## example 1: BWS using a two-level OMED
## suppose that ten respondents answered twelve BWS questions valuing nine items

# create a two-level OMED with nine factors
set.seed(123) # set seed for random number generator
des1 <- oa.design(nfactors = 9, nlevels = 2)
des1 # resultant design with twelve rows, nine columns, and level values of 1 and 2

# set item names, in which the order of elements corresponds to 
#  the order of columns in des1
items1 <- LETTERS[1:9] # item names are "A", "B", ..., "I"

# create questions for BWS
bws.questionnaire(
 choice.sets = des1,
 design.type = 1, # OMED
 item.names = items1)

# set a respondent data set in a row number format
res1 <- data.frame(
 ID  = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), # id variable
 B1  = c(1, 1, 1, 1, 3, 5, 1, 1, 1, 1),  # best item in question 1
 W1  = c(5, 5, 3, 5, 4, 1, 4, 2, 4, 3),  # worst item in question 1
 B2  = c(1, 3, 1, 4, 1, 2, 3, 2, 1, 2),  # best item in question 2
 W2  = c(5, 5, 5, 5, 3, 5, 1, 4, 4, 5),  # worst item in question 2
 B3  = c(1, 2, 1, 2, 4, 1, 1, 3, 1, 3),  # best item in question 3
 W3  = c(4, 3, 3, 3, 3, 4, 4, 2, 3, 4),  # worst item in question 3
 B4  = c(2, 1, 3, 5, 2, 3, 1, 1, 2, 5),  # best item in question 4
 W4  = c(4, 4, 5, 3, 5, 5, 3, 5, 4, 3),  # worst item in question 4
 B5  = c(2, 3, 3, 2, 2, 2, 2, 1, 3, 2),  # best item in question 5
 W5  = c(4, 4, 4, 4, 3, 4, 4, 4, 4, 3),  # worst item in question 5
 B6  = c(2, 1, 1, 3, 3, 3, 1, 1, 1, 1),  # best item in question 6
 W6  = c(1, 2, 3, 2, 1, 2, 3, 2, 2, 3),  # worst item in question 6
 B7  = c(3, 3, 1, 1, 3, 6, 1, 2, 1, 7),  # best item in question 7
 W7  = c(9, 6, 8, 4, 8, 2, 6, 5, 4, 6),  # worst item in question 7
 B8  = c(2, 1, 2, 2, 2, 1, 1, 3, 1, 1),  # best item in question 8
 W8  = c(3, 3, 3, 3, 4, 4, 4, 4, 3, 4),  # worst item in question 8
 B9  = c(2, 1, 3, 1, 4, 2, 3, 4, 1, 1),  # best item in question 9
 W9  = c(3, 2, 2, 3, 3, 3, 2, 2, 3, 4),  # worst item in question 9
 B10 = c(1, 1, 1, 1, 1, 1, 1, 4, 3, 3),  # best item in question 10
 W10 = c(4, 2, 2, 4, 4, 3, 4, 2, 4, 4),  # worst item in question 10
 B11 = c(2, 1, 3, 3, 3, 2, 1, 2, 2, 4),  # best item in question 11
 W11 = c(1, 4, 4, 1, 1, 4, 4, 4, 1, 1),  # worst item in question 11
 B12 = c(2, 2, 1, 1, 1, 1, 3, 2, 1, 2),  # best item in question 12
 W12 = c(3, 3, 2, 3, 3, 2, 2, 3, 3, 3))  # worst item in question 12

# create a data set for the maxdiff model analysis 
#  by combining the choice sets and respondent data set
dat1 <- bws.dataset(
 respondent.dataset = res1,
 response.type = 1, # row number format
 choice.sets = des1,
 design.type = 1)   # OMED

# analyze responses to BWS questions
# counting approach
bws1 <- bws.count(dat1)
# modeling approach
# note: ITEM5 is excluded from fr1 to normalize its coefficient to zero
fr1 <- RES ~ ITEM1 + ITEM2 + ITEM3 + ITEM4 + ITEM6 + ITEM7 +
             ITEM8 + ITEM9 + strata(STR)
clg1 <- clogit(formula = fr1, data = dat1)
clg1


## example 2: BWS using a balanced incomplete block design
## suppose that ten respondents answered seven BWS questions valuing seven items

# create a BIBD with seven items, four items per question, and seven questions
set.seed(123) # set seed for random number generator
des2 <- find.BIB(trt = 7, k = 4, b = 7)
isGYD(des2)  # check whether the design is a BIBD
des2 # resultant design with seven rows, four columns, and level values ranging from 1 to 7

# set item names, in which the order of element corresponds to 
#  the order of level values in des2
items2 <- LETTERS[1:7]

# create questions for BWS
bws.questionnaire(
 choice.sets = des2,
 design.type = 2, # BIBD
 item.names = items2)

# set a respondent data set in a row number format
res2 <- data.frame(
 ID = c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10), # id variable
 B1 = c(2, 1, 2, 4, 2, 2, 2, 1, 2, 1),  # best item in question 1
 W1 = c(3, 4, 3, 3, 1, 3, 3, 2, 3, 3),  # worst item in question 1
 B2 = c(4, 3, 3, 3, 3, 1, 1, 2, 1, 1),  # best item in question 2
 W2 = c(3, 2, 4, 1, 2, 3, 3, 4, 2, 4),  # worst item in question 2
 B3 = c(3, 1, 1, 1, 1, 1, 1, 1, 2, 1),  # best item in question 3
 W3 = c(1, 4, 2, 2, 4, 4, 2, 3, 3, 3),  # worst item in question 3
 B4 = c(2, 2, 1, 3, 2, 2, 2, 2, 4, 1),  # best item in question 4
 W4 = c(4, 4, 3, 4, 1, 3, 4, 1, 2, 4),  # worst item in question 4
 B5 = c(1, 3, 2, 1, 3, 2, 1, 1, 1, 1),  # best item in question 5
 W5 = c(3, 1, 4, 4, 1, 4, 3, 2, 4, 3),  # worst item in question 5
 B6 = c(2, 1, 1, 3, 2, 4, 4, 3, 3, 3),  # best item in question 6
 W6 = c(3, 2, 3, 4, 3, 2, 2, 4, 4, 2),  # worst item in question 6
 B7 = c(2, 1, 3, 1, 3, 2, 3, 3, 2, 2),  # best item in question 7
 W7 = c(4, 4, 4, 4, 4, 1, 4, 1, 4, 4))  # worst item in question 7

# create a data set for the maxdiff model analysis
#  by combining the choice sets and respondent data set
dat2 <- bws.dataset(
 respondent.dataset = res2,
 response.type = 1,   # row number format
 choice.sets = des2,
 design.type = 2,     # BIBD
 item.names = items2) # state variables are labeled using item names

# analyze responses to BWS questions
# counting approach
bws2 <- bws.count(dat2)
bws2
# the argument cl is set to 2 to generaet a data set
#  of the S3 class 'bws.count2'
bws2.2 <- bws.count(dat2, cl = 2)
plot(bws2.2, score = "bw")
barplot(bws2.2, score = "bw")
sum(bws2.2)
summary(bws2.2)
# modeling approach
# note: D is excluded from fr2 to normalized its coefficient to zero
fr2 <- RES ~ A + B + C + E + F + G + strata(STR)
clg2 <- clogit(fr2, data = dat2)
clg2
bws.sp(clg2, base = "D", order = TRUE)



