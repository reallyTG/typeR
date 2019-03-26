library(roperators)


### Name: %ni%
### Title: Logical operators
### Aliases: %ni% %xor% %aon%

### ** Examples


 #### Not in ####

 "z" %ni%  c("a", "b", "c")
 #  TRUE

 #### Exclusive or  ####

 TRUE %xor% TRUE
 # FALSE

 FALSE %xor% FALSE
 # FALSE

 FALSE %xor% TRUE
 # TRUE

 #### All-or-nothing ####

 TRUE %aon% TRUE
 # TRUE

 FALSE %aon% FALSE
 # TRUE

 FALSE %aon% TRUE
 # FALSE




