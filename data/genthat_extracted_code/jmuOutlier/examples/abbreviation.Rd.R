library(jmuOutlier)


### Name: abbreviation
### Title: Allows Abbreviations of Character Data
### Aliases: abbreviation
### Keywords: abbreviation

### ** Examples

x1 = "two";  x2 = "l";   x3 = "gr";   x4 = "greater";  x5 = "NotInChoices"
choices = c("two.sided", "less", "greater")
abbreviation( x1, choices ) ; abbreviation( x2, choices ) ; abbreviation( x3, choices ) 
abbreviation( x4, choices ) ; abbreviation( x5, choices )



