library(roperators)


### Name: %==%
### Title: Enhanced comparisons
### Aliases: %==% %===% %>=% %<=% %><% %>=<%

### ** Examples


 ## Greater/Less than | Equal

 c(1, NA, 3, 4)  ==  c(1, NA, 4, 3)
 #  TRUE    NA  FALSE FALSE

 c(1, NA, 3, 4) %==% c(1, NA, 4, 3)
 #  TRUE  TRUE  FALSE FALSE

 c(1, NA, 3, 4) %>=% c(1, NA, 4, 3)
 #  TRUE  TRUE FALSE  TRUE

 c(1, NA, 3, 4) %<=% c(1, NA, 4, 3)
 #  TRUE  TRUE TRUE  FALSE


 # Strict equality - a la javascript's ===
 # Only tru if the class and value of x and y are the same
x <- int(2)
y <- 2
x == y         # TRUE
x %===% y      # FALSE
x %===% int(y) # TRUE


 # NOTE parentheses surrounding expression before this operator are necessary
 # Without parentheses it would be interpreted as .1 + .1 + (.1 %~=% .3)


 #### Between ####

 # ends excluded

 2 %><% c(1, 3)
 # TRUE

 3 %><% c(1, 3)
 # FALSE

 # ends included

 2 %>=<% c(1, 3)
 # TRUE

 3 %>=<% c(1, 3)
 # TRUE





