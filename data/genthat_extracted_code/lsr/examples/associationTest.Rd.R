library(lsr)


### Name: associationTest
### Title: Chi-square test of association / independence
### Aliases: associationTest

### ** Examples


df <- data.frame(     
 gender=factor(c("male","male","male","male","female","female","female")),
 answer=factor(c("heads","heads","heads","heads","tails","tails","heads"))
)

associationTest( ~ gender + answer, df )




