library(spatstat)


### Name: mergeLevels
### Title: Merge Levels of a Factor
### Aliases: mergeLevels
### Keywords: manip spatial

### ** Examples

   likert <- c("Strongly Agree", "Agree", "Neutral",
               "Disagree", "Strongly Disagree")
   answers <- factor(sample(likert, 15, replace=TRUE), levels=likert)
   answers
   mergeLevels(answers, Positive=c("Strongly Agree", "Agree"),
                        Negative=c("Strongly Disagree", "Disagree"))



