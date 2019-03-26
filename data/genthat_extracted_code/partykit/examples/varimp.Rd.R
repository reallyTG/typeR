library(partykit)


### Name: varimp
### Title: Variable Importance
### Aliases: varimp varimp.constparty varimp.cforest
### Keywords: tree

### ** Examples

    
   set.seed(290875)
   data("readingSkills", package = "party")
   readingSkills.cf <- cforest(score ~ ., data = readingSkills, 
                               mtry = 2, ntree = 50)

   # standard importance
   varimp(readingSkills.cf)

   # conditional importance, may take a while...
   varimp(readingSkills.cf, conditional = TRUE)




