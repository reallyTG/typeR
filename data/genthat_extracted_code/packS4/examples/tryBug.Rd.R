library(packS4)


### Name: tryBug
### Title: ~ Function: tryBug ~
### Aliases: tryBug

### ** Examples

### A function...
f <- function(oldYoung){
   if(oldYoung=="old"){
      cat("You are not that old!")
   }else{
      cat("You are young, great for you!")
   }
}

### ... that we test
# f("old") # ok
# f("young") # ok
# tryBug(f("dead")) #not ok

### The corrected function...
f <- function(oldYoung){
   if(oldYoung=="old"){
      cat("You are not that old!")
   }else{
      if(oldYoung=="young"){
         cat("You are young, great for you!")
      }else{
         stop("We deal only with young and old peoples!")
      }
   }
}

### ... with its new tests.
f("old")
f("young")
tryBug(f("dead"))




