library(docstring)


### Name: docstring
### Title: Display a docstring
### Aliases: docstring ?

### ** Examples

## Not run: 
##D square <- function(x){
##D   #' Square a number
##D   #'
##D   #' Calculates the square of the input
##D   #' 
##D   #' @param x the input to be squared
##D 
##D   return(x^2)
##D }
##D 
##D docstring(square)
##D ?square
##D 
##D 
##D mypaste <- function(x, y = "!"){
##D   #' Paste two items
##D   #' 
##D   #' @description This function pastes two items
##D   #' together.  
##D   #'
##D   #' By using the description tag you'll notice that I
##D   #' can have multiple paragraphs in the description section
##D   #' 
##D   #' @param x character. The first item to paste
##D   #' @param y character. The second item to paste Defaults to "!" but
##D   #' "?" would be pretty great too
##D   #' @usage mypaste(x, y)
##D   #' @return The inputs pasted together as a character string.
##D   #' @details The inputs can be anything that can be input into
##D   #' the paste function.
##D   #' @note And here is a note. Isn't it nice?
##D   #' @section I Must Warn You:
##D   #' The reference provided is a good read.
##D   #' \subsection{Other warning}{
##D   #'   It is completely irrelevant to this function though.
##D   #' }
##D   #' 
##D   #' @references Tufte, E. R. (2001). The visual display of 
##D   #' quantitative information. Cheshire, Conn: Graphics Press.
##D   #' @examples
##D   #' mypaste(1, 3)
##D   #' mypaste("hey", "you")
##D   #' mypaste("single param")
##D   #' @export
##D   #' @importFrom base paste
##D   
##D   return(paste(x, y))
##D }
##D   
##D ?mypaste
## End(Not run)




