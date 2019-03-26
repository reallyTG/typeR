library(bazar)


### Name: %?%
### Title: If-Then-Else ternary operator
### Aliases: %?% %:%

### ** Examples

(capitalize <- sample(c(TRUE, FALSE), 1))
capitalize %?% LETTERS[1:3] %:% letters[1:2]

# Does not work
## Not run: 
##D capitalize %?% 1*1:3 %:% 1:2
## End(Not run)

# Does work
capitalize %?% {1*1:3} %:% 1:2

# Does work too
capitalize %?% (1*1:3) %:% 1:2

# Vectorized version also works
c(capitalize,!capitalize) %?% "A" %:% c("b","c")

# Chaining operators is permitted 
FALSE %?% "a" %:% 
  (FALSE %?% "b") %:% 
  (capitalize %?% "C") %:% "c" 




