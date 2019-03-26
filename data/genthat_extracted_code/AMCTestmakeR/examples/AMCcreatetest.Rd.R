library(AMCTestmakeR)


### Name: AMCcreatetest
### Title: Create a full Auto-Multiple-Choice test with a main .tex file
###   ('groups.tex'), a file for questions ('questions.tex'), a file for
###   elements ('elements.tex'.
### Aliases: AMCcreatetest

### ** Examples

# Create all LaTeX files

## Not run: 
##D  AMCcreatetest(
##D  # Arguments passed to AMCcreatequestions()
##D  question = "How much is $1+1$?",
##D  correctanswers = 2,
##D  incorrectanswer = list("3", "11", "4"),
##D  # Arguments passed to AMCcreateelements()
##D  shufflequestions = T,
##D  sections = F,
##D  # Part used for test options
##D  title = "Exam", #Custom title
##D  fontsize = 11, #change fontsize
##D  identifier = "ID Number", #change identifier
##D  twosided = F, #print in one sided
##D  instructions = T, #show an instructions block to students
##D  separateanswersheet = F, #use a separate answer sheet
##D  answersheettitle = "Respond Here", #Change answer sheet title
##D  answersheetinstructions = "Fill the boxes" #Answer sheet instructions
##D   )
## End(Not run)




