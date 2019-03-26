## ---- include=FALSE------------------------------------------------------
options(help_type="text")

# A pager that outputs to the console
console_pager <- function(x, ...){
    input <- readLines(x)
    # Had some issues with _ getting displayed
    # in the output console output which
    # messed up rendering in the created html vignette
    # So remove that before outputting.
    input <- gsub("_", "", input)
    cat(paste(input,collapse="\n"), "\n")}
options(pager=console_pager)
options(docstring_rstudio_help_pane = FALSE)

## ------------------------------------------------------------------------
square <- function(x){
    #' Computes the square of the input
    return(x^2)
}

## ---- echo=TRUE----------------------------------------------------------
square

## ------------------------------------------------------------------------
?square

## ------------------------------------------------------------------------
library(docstring)

## ---- comment=NA---------------------------------------------------------
?square # Below is the generated help file:

## ---- comment=NA---------------------------------------------------------
test <- function(){
    #' This is my title line
    #'
    #' All of this text goes
    #' in the Description section
    #'
    #' This part goes in the Details!
    return()
}

?test

## ---- comment=NA---------------------------------------------------------
square <- function(x){
    #' Squares a number
    #'
    #' Provides the square of the input
    #' @param x The value to be squared
    return(x^2)
}

?square

## ---- comment=NA---------------------------------------------------------
mypaste <- function(x, y = "!"){
  #' Paste two items
  #' 
  #' @description This function pastes two items
  #' together.  
  #'
  #' By using the description tag you'll notice that I
  #' can have multiple paragraphs in the description section
  #' 
  #' @param x character. The first item to paste
  #' @param y character. The second item to paste Defaults to "!" but
  #' "?" would be pretty great too
  #' @usage mypaste(x, y)
  #' @return The inputs pasted together as a character string.
  #' @details The inputs can be anything that can be input into
  #' the paste function.
  #' @note And here is a note. Isn't it nice?
  #' @section I Must Warn You:
  #' The reference provided is a good read.
  #' \subsection{Other warning}{
  #'   It is completely irrelevant to this function though.
  #' }
  #' 
  #' @references Tufte, E. R. (2001). The visual display of 
  #' quantitative information. Cheshire, Conn: Graphics Press.
  #' @examples
  #' mypaste(1, 3)
  #' mypaste("hey", "you")
  #' mypaste("single param")
  #' @export
  #' @importFrom base paste

  return(paste(x, y))
}

?mypaste

