library(ProfessR)


### Name: prep.exam
### Title: Prepare Exam for Latex (simple style)
### Aliases: prep.exam
### Keywords: misc

### ** Examples




## Not run: 
##D ######  since the program produces a file on the local
##D ######   system, do not run this example
##D 
##D 
##D examdate="THURS Sep 20 2007"
##D 
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
##D 
##D 
##D instructions=c("There are 50 questions.",
##D "Answer all questions.", "Mark clearly.")
##D \dontrun{
##D prep.exam(outMAST, outtex , instructor=Me, examdate=examdate,
##D course=course, examname=examname, instructions=instructions)
##D }
##D 
## End(Not run)






