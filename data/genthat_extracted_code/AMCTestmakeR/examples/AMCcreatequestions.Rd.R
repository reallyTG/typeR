library(AMCTestmakeR)


### Name: AMCcreatequestions
### Title: Generate AMC LaTeX question codes in the console, in a LaTeX
###   file, or as a vector.
### Aliases: AMCcreatequestions

### ** Examples

#Creating a single question

AMCcreatequestions("How much is $1+1$?",2,list("3", "11"))

#Presenting answers in multiple columns (LaTeX environment 'multicols' is used)

AMCcreatequestions("How much is $1+1$?",2,list("3","11"),multicols = 2)

#Creating an entire questionnaire from a dataset of questions
## Defining the questions (don't forget to escape R special characters)
question <- c("How much is $1+1$ ?", "How much is $1 \\times 1$ ?",
  "How much is $\\frac{1}{2}$ ?")
  correct <- c(2,1,0.5)
  incorrect1 <- c(3,4,10)
  incorrect2 <- c(1,3,100)
  incorrect3 <- c(4,8,NA) #Empty values (NA and "") are skipped

## Generating the AMC LaTeX code
AMCcreatequestions(
  question = question,
  correctanswers = correct,
  incorrectanswers = list(incorrect1,incorrect2,incorrect3))

#Changing the code prefix from "Q" to "MATH"

AMCcreatequestions(
  question = question,
  correctanswers = correct,
  incorrectanswers = list(incorrect1,incorrect2,incorrect3),
  codeprefix = "MATH")




