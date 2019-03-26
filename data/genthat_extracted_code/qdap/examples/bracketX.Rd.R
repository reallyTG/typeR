library(qdap)


### Name: bracketX
### Title: Bracket Parsing
### Aliases: bracketX bracketXtract genX genXtract
### Keywords: bracket, bracket-remove, curly-braces parenthesis,

### ** Examples

## Not run: 
##D examp <- structure(list(person = structure(c(1L, 2L, 1L, 3L), 
##D     .Label = c("bob", "greg", "sue"), class = "factor"), text = 
##D     c("I love chicken [unintelligible]!", 
##D     "Me too! (laughter) It's so good.[interrupting]", 
##D     "Yep it's awesome {reading}.", "Agreed. {is so much fun}")), .Names = 
##D     c("person", "text"), row.names = c(NA, -4L), class = "data.frame")    
##D 
##D examp                                                              
##D bracketX(examp$text, "square")  
##D bracketX(examp$text, "curly") 
##D bracketX(examp$text, c("square", "round")) 
##D bracketX(examp$text)  
##D                                               
##D                                               
##D bracketXtract(examp$text, "square")  
##D bracketXtract(examp$text, "curly")  
##D bracketXtract(examp$text, c("square", "round")) 
##D bracketXtract(examp$text, c("square", "round"), merge = FALSE)  
##D bracketXtract(examp$text)  
##D bracketXtract(examp$text, with = TRUE)
##D 
##D paste2(bracketXtract(examp$text, "curly"), " ")
##D 
##D x <- c("Where is the /big dog#?", 
##D     "I think he's @arunning@b with /little cat#.")
##D genXtract(x, c("/", "@a"), c("#", "@b"))
##D 
##D x <- c("Where is the L1big dogL2?", 
##D     "I think he's 98running99 with L1little catL2.")
##D genXtract(x, c("L1", 98), c("L2", 99))
##D 
##D DATA$state  #notice number 1 and 10
##D genX(DATA$state, c("is", "we"), c("too", "on"))
## End(Not run)



