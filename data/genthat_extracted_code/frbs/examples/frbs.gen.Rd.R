library(frbs)


### Name: frbs.gen
### Title: The frbs model generator
### Aliases: frbs.gen

### ** Examples

#################################################
## 1. The following codes show how to generate a fuzzy model
## using the frbs.gen function for regression tasks.
## The following are three scenarios:
## 1a. Using the Mamdani model
## 1b. Using the Takagi Sugeno Kang model
## 1c. Using the Mamdani model and internal functions: fuzzifier, etc.
## Note:
## In the examples, let us consider four input variabels and one output variable.
## Some variables could be shared together for other examples.
#################################################

## Define shape and parameters of membership functions of input variables.
## Please see the fuzzifier function to construct the matrix.
## It can be seen that in this case we employ TRAPEZOID as the membership functions.
varinp.mf <- matrix(c(2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA,
                      2, 0, 35, 75, NA, 3, 35, 75, 100, NA,
                      2, 0, 20, 40, NA, 1, 20, 50, 80, NA, 3, 60, 80, 100, NA,
                      2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA),
                      nrow = 5, byrow = FALSE)

## Define number of linguistic terms of the input variables.
## Suppose, we have 3, 2, 3, and 3 numbers of linguistic terms
## for the first, second, third and fourth variables, respectively.
num.fvalinput <- matrix(c(3, 2, 3, 3), nrow=1)

## Give the names of the linguistic terms of each input variables.
varinput.1 <- c("a1", "a2", "a3")
varinput.2 <- c("b1", "b2")
varinput.3 <- c("c1", "c2", "c3")
varinput.4 <- c("d1", "d2", "d3")
names.varinput <- c(varinput.1, varinput.2, varinput.3, varinput.4)

## Set interval of data.
range.data <- matrix(c(0,100, 0, 100, 0, 100, 0, 100, 0, 100), nrow=2)

## Define inference parameters.
type.defuz <- "WAM"
type.tnorm <- "MIN"
type.snorm <- "MAX"
type.implication.func <- "ZADEH"

## Give the name of simulation.
name <- "Sim-0"

## Provide new data for testing.
newdata <- matrix(c(15, 80, 85, 85, 45, 75, 78, 70), nrow = 2, byrow = TRUE)
## the names of variables
colnames.var <- c("input1", "input2", "input3", "input4", "output1")

###################################################################
## 1a. Using the Mamdani Model
####################################################################
## Define number of linguistic terms of output variable.
## In this case, we set the number of linguistic terms to 3.
num.fvaloutput <- matrix(c(3), nrow = 1)

## Give the names of the linguistic terms of the output variable.
varoutput.1 <- c("e1", "e2", "e3")
names.varoutput <- c(varoutput.1)

## Define the shapes and parameters of the membership functions of the output variables.
varout.mf <- matrix(c(2, 0, 20, 40, NA, 4, 20, 40, 60, 80, 3, 60, 80, 100, NA),
                      nrow = 5, byrow = FALSE)

## Set type of model which is "MAMDANI" or "TSK" for Mamdani or
## Takagi Sugeno Kang models, respectively.
## In this case, we choose the Mamdani model.
type.model <- "MAMDANI"

## Define the fuzzy IF-THEN rules; In this case, we provide two scenarios using different operators:
rule.or <- matrix(c("a1", "or", "b1", "or", "c1", "or", "d1", "->", "e1",
                 "a2", "and", "b2", "and", "c2", "and", "d2", "->", "e2",
                 "a3", "and", "b2", "and", "c2", "and", "d1", "->", "e3"),
                 nrow = 3, byrow = TRUE)

## Define the fuzzy IF-THEN rules;
rule.and <- matrix(c("a1", "and", "b1", "and", "c1", "and", "d1", "->", "e1",
                 "a2", "and", "b2", "and", "c2", "and", "d2", "->", "e2",
                 "a3", "and", "b2", "and", "c2", "and", "d1", "->", "e3"),
                 nrow = 3, byrow = TRUE)

## Generate a fuzzy model with frbs.gen.
object.or <- frbs.gen(range.data, num.fvalinput, names.varinput,
                 num.fvaloutput, varout.mf, names.varoutput, rule.or,
                 varinp.mf, type.model, type.defuz, type.tnorm,
                 type.snorm, func.tsk = NULL, colnames.var, type.implication.func, name)

object.and <- frbs.gen(range.data, num.fvalinput, names.varinput,
                 num.fvaloutput, varout.mf, names.varoutput, rule.and,
                 varinp.mf, type.model, type.defuz, type.tnorm,
                 type.snorm, func.tsk = NULL, colnames.var, type.implication.func, name)

## Plot the membership function.
plotMF(object.and)

## Predicting using new data.
res.or <- predict(object.or, newdata)$predicted.val
res.and <- predict(object.and, newdata)$predicted.val

#####################################################################
## 1b. Using the Takagi Sugeno Kang (TSK) Model
#####################################################################
## Define "TSK" for the Takagi Sugeno Kang model
type.model <- "TSK"

## Define linear equations for consequent parts.
## The following command means that we have three equation related to the rules we have.
## e.g., the first equation is 1*inputvar.1 + 1*inputvar.2 + 5*inputvar.3 + 2*inputvar.4 + 1,
## where inputvar.i is a value of the i-th input variable.
func.tsk <- matrix(c(1, 1, 5, 2, 1, 3, 1, 0.5, 0.1, 2, 1, 3, 2, 2, 2),
            nrow = 3, byrow = TRUE)

## Define the fuzzy IF-THEN rules;
## For TSK model, it isn't necessary to put linguistic term in consequent parts.
## Make sure that each rule has a "->" sign.
rule <- matrix(c("a1", "and", "b1", "and", "c1", "and", "d1", "->",
                 "a2", "and", "b2", "and", "c2", "and", "d2", "->",
                 "a3", "and", "b2", "and", "c2", "and", "d1", "->"),
                 nrow = 3, byrow = TRUE)

## Generate a fuzzy model with frbs.gen.
## It should be noted that for TSK model, we do not need to input:
## num.fvaloutput, varout.mf, names.varoutput, type.defuz.
object <- frbs.gen(range.data, num.fvalinput, names.varinput,
             num.fvaloutput = NULL, varout.mf = NULL, names.varoutput = NULL, rule,
				varinp.mf, type.model, type.defuz = NULL, type.tnorm, type.snorm,
             func.tsk, colnames.var, type.implication.func, name)

## Plot the membership function.
plotMF(object)

## Predicting using new data.
res <- predict(object, newdata)$predicted.val

######################
## 1c. Using the same data as in the previous example, this example performs
## step by step of the generation of a fuzzy rule-based system
######################
## Using the Mamdani model.
type.model <- "MAMDANI"

## Construct rules.
rule <- matrix(c("a1", "and", "b1", "and", "c1", "and", "d1", "->", "e1",
                 "a2", "and", "b2", "and", "c2", "and", "d2", "->", "e2",
                 "a3", "and", "b2", "and", "c2", "and", "d1", "->", "e3"),
                 nrow = 3, byrow = TRUE)

## Check input data given by user.
rule <- rulebase(type.model, rule, func.tsk = NULL)

## Fuzzification Module:
## In this function, we convert crisp into linguistic values/terms
## based on the data and the parameters of the membership function.
## The output: a matrix representing the degree of the membership of the data
num.varinput <- ncol(num.fvalinput)
MF <- fuzzifier(newdata, num.varinput, num.fvalinput, varinp.mf)

## Inference Module:
## In this function, we will calculate the confidence factor on the antecedent for each rule
## considering t-norm and s-norm.
miu.rule <- inference(MF, rule, names.varinput, type.tnorm, type.snorm)

## Defuzzification Module.
## In this function, we calculate and convert the linguistic values back into crisp values.
range.output <- range.data[, ncol(range.data), drop = FALSE]
result <- defuzzifier(newdata, rule, range.output, names.varoutput,
                  varout.mf, miu.rule, type.defuz, type.model, func.tsk = NULL)


#################################################
## 2. The following codes show how to generate a fuzzy model
## using the frbs.gen function for classification tasks using the Mamdani model.
#################################################
## define range of data.
## Note. we only define range of input data.
range.data.input <- matrix(c(0, 1, 0, 1, 0, 1, 0, 1), nrow=2)

## Define shape and parameters of membership functions of input variables.
## Please see fuzzifier function to construct the matrix.
## In this case, we are using TRIANGLE for membership functions.
varinp.mf <- matrix(c(1, 0, 0, 0.5, NA, 1, 0, 0.5, 1, NA, 1, 0.5, 1, 1, NA,
                      1, 0, 0, 0.5, NA, 1, 0, 0.5, 1, NA, 1, 0.5, 1, 1, NA,
                      1, 0, 0, 0.5, NA, 1, 0, 0.5, 1, NA, 1, 0.5, 1, 1, NA,
                      1, 0, 0, 0.5, NA, 1, 0, 0.5, 1, NA, 1, 0.5, 1, 1, NA),
                      nrow = 5, byrow = FALSE)

## Define number of linguistic terms of input variables.
## Suppose, we have 3, 3, 3, and 3 numbers of linguistic terms
## for first up to fourth variables, respectively.
num.fvalinput <- matrix(c(3, 3, 3, 3), nrow=1)

## Give the names of the linguistic terms of each input variable.
varinput.1 <- c("v.1_a.1", "v.1_a.2", "v.1_a.3")
varinput.2 <- c("v.2_a.1", "v.2_a.2", "v.2_a.3")
varinput.3 <- c("v.3_a.1", "v.3_a.2", "v.3_a.3")
varinput.4 <- c("v.4_a.1", "v.4_a.2", "v.4_a.3")
names.varinput <- c(varinput.1, varinput.2, varinput.3, varinput.4)

## Provide inference parameters.
type.tnorm <- "MIN"
type.snorm <- "MAX"
type.implication.func <- "ZADEH"
type.model <- "FRBCS"

## Give the name of simulation.
name <- "Sim-0"

## Provide new data for testing.
newdata<- matrix(c(0.45, 0.5, 0.89, 0.44, 0.51, 0.99, 0.1, 0.98, 0.51,
                   0.56, 0.55, 0.5), nrow = 3, byrow = TRUE)

## the names of variables
colnames.var <- c("input1", "input2", "input3", "input4", "output1")

## Construct rules.
## It should be noted that on consequent parts we define categorical values instead of
## linguistic terms.
rule <- matrix(
       c("v.1_a.2", "and", "v.2_a.2", "and", "v.3_a.3", "and", "v.4_a.2", "->", "3",
         "v.1_a.2", "and", "v.2_a.3", "and", "v.3_a.1", "and", "v.4_a.3", "->", "1",
         "v.1_a.2", "and", "v.2_a.2", "and", "v.3_a.2", "and", "v.4_a.2", "->", "2"),
         nrow = 3, byrow = TRUE)

## Generate frbs object.
object <- frbs.gen(range.data = range.data.input, num.fvalinput,
             names.varinput, num.fvaloutput = NULL, varout.mf = NULL,
             names.varoutput = NULL, rule, varinp.mf, type.model,
             type.defuz = NULL, type.tnorm, type.snorm, func.tsk = NULL,
             colnames.var, type.implication.func, name)

## Plot the shape of membership functions.
plotMF(object)

## Predicting using new data.
res <- predict(object, newdata)

####################################################
## 3. The following example shows how to convert
##    the frbs model into frbsPMML
####################################################
## In this example, we are using the last object of FRBS.
## Display frbsPMML in R
objPMML <- frbsPMML(object)

## Write into a file with .frbsPMML extention
## Not run: 
##D write.frbsPMML(objPMML, fileName="obj_frbsPMML")
##D 
##D ## Read the frbsPMML file into an R object of FRBS
##D obj <- read.frbsPMML("obj_frbsPMML.frbsPMML")
## End(Not run)



