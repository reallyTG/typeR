library(ProfessR)


### Name: version.exam
### Title: Create 1 instance of a specific Exam
### Aliases: version.exam
### Keywords: misc

### ** Examples

##  the example creates files on the local system - thus not run
## Not run: 
##D data(QBANK1)
##D 
##D examdate="THURS Sep 20 2007"
##D 
##D version.exam(QBANK1, "exam1A" , exnumber="Exam 1", seqnum="1", examdate=examdate)
##D 
##D 
##D ##################
##D examdate=date()
##D 
##D seqnum="1"
##D exnumber="Exam 1"
##D V = "exam1A"
##D outtex = paste(sep=".",V, "tex" )
##D outMAST  = paste(sep="", V, "MAST" )
##D 
##D 
##D MASTtex  = paste(sep=".", outMAST , "tex" )
##D 
##D outsolut  = paste(sep="", V, "solutions.tex" )
##D Me = "Jonathan M. Lees"
##D 
##D course="GEOL 105"
##D 
##D examname=paste(sep=" ", exnumber, "Seq", seqnum)
##D 
##D K = length(QBANK1)
##D 
##D instructions=c(
##D paste(sep=" ", "There are",K," number of questions."),
##D "Answer all questions.","Use number 2 pencil",
##D "Mark each box clearly.")
##D 
##D version.exam(QBANK1, "exam1B" , exnumber="Exam 1", seqnum="B",
##D examdate=examdate, instructor=Me, course=course , instructions=instructions)
##D 
## End(Not run)




