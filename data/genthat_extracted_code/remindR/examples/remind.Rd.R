library(remindR)


### Name: remind
### Title: Insert, extract, and print "reminders" for functions and objects
### Aliases: remind remind.default remind.function remind<- print.reminder

### ** Examples

x <- 1:3
remind(x)
remind(x) <- c("first comment","and a second")
remind(x)
remind(x) <- NULL ## removes reminder
remind(x)
f <- function(x){
   y <- x
   ## Some miscellaneous comments
   ## Now <<This is reminder 1>> and next
   ## This is
   ## yet another <<reminder 2 is this>>
   ## some more stuff
   y
}
f(5)
remind(f)
remind(f)<- "something else"
remind(f)
## "tooltip" type example:
my.summary<- function(x, fun = mean,...)fun(x)
remind(my.summary)<-
"Don't forget to include the na.rm argument if missing values might be present"
remind(my.summary)
rm(f,x,my.summary)



