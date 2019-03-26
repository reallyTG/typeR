## ----comment=NA----------------------------------------------------------
library(AMCTestmakeR)

## ----comment=NA----------------------------------------------------------
AMCcreatequestions(
  question = "How much is $1+1$?",
  correctanswers = 2,
  incorrectanswers = list(3, 11))

## ------------------------------------------------------------------------
question <- c("How much is $1+1$ ?",
              "How much is $1 \\times 1$ ?",
              "How much is $\\frac{1}{2}$ ?")
correct <- c(2,1,0.5)
incorrect1 <- c(3,4,10)
incorrect2 <- c(1,3,100)
incorrect3 <- c(4,8,NA)

## ------------------------------------------------------------------------
AMCcreatequestions(question = question,
   correctanswers = correct,
   incorrectanswers = list(incorrect1,incorrect2,incorrect3))

## ------------------------------------------------------------------------
AMCcreatequestions(element = c("ADD", "MULT", "DIV"),
   question = question,
   correctanswers = correct,
   incorrectanswers = list(incorrect1,incorrect2,incorrect3))

## ------------------------------------------------------------------------
AMCcreatequestions(code = c("ADD1", "MULT1", "DIV1"),
   question = question,
   correctanswers = correct,
   incorrectanswers = list(incorrect1,incorrect2,incorrect3))

## ------------------------------------------------------------------------
AMCcreatequestions(codeprefix = "MATH",
   question = question,
   correctanswers = correct,
   incorrectanswers = list(incorrect1,incorrect2,incorrect3))

## ----eval=F--------------------------------------------------------------
#  AMCcreatetest("How much is $1+2$?",2,list("3", "11"))

## ----eval=F--------------------------------------------------------------
#  AMCcreatetest(
#    #This part is passed to the AMCcreatequestions() function:
#    question = "How much is $1+1$?",
#    2,
#    list("3", "11"),
#    #The next part is passed to AMCcreateelements():
#    shuffle = T,
#    sections = T,
#    #The last part is for general test options:
#    title = "Exam", #Custom title
#    paper = "a4", #change the paper for a4
#    fontsize = 11, #change fontsize
#    identifier = "ID Number", #change identifier
#    twosided = F, #print in one sided
#    instructions = "Don't respond here.", #show an instructions block
#    separateanswersheet = T, #use a separate answer sheet
#    answersheettitle = "Respond Here", #Change answer sheet title
#    answersheetinstructions = "Fill the boxes."#Answer sheet instructions
#  )

## ------------------------------------------------------------------------
AMCcreateelements(element = c("ADD", "MULT", "DIV"), shuffle = T, sections = T)

## ------------------------------------------------------------------------
AMCcreateelements(element = c("MATH", "MATH", "MATH", "STAT"), shuffle = F, sections = F)

