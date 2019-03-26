library(clickstream)


### Name: Pattern-class
### Title: Class 'Pattern'
### Aliases: Pattern-class
### Keywords: classes

### ** Examples


# show Pattern definition
showClass("Pattern")

# create simple Pattern objects
pattern1 <- new("Pattern", sequence = c("h", "c", "p"))
pattern2 <- new("Pattern", sequence = c("c", "p", "p"), probability = 0.2)
pattern3 <- new("Pattern", sequence = c("h", "p", "p"), probability = 0.35,
        absorbingProbabilities = data.frame(d = 0.6, o = 0.4))



