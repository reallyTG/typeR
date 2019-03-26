library(ProfessR)


### Name: rename.answers
### Title: Rename Answers
### Aliases: rename.answers
### Keywords: misc

### ** Examples

data(QBANK1)


newnames=letters[1:26]
NEWQB = rename.answers(QBANK1, newnames=newnames ) 
NEWQB[[35]]

newnames=1:26
NEWQB = rename.answers(QBANK1, newnames=newnames ) 
NEWQB[[35]]

newnames=LETTERS[1:26]
NEWQB = rename.answers(QBANK1, newnames=newnames ) 
NEWQB[[35]]





