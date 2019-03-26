library(party)


### Name: readingSkills
### Title: Reading Skills
### Aliases: readingSkills
### Keywords: datasets

### ** Examples


   set.seed(290875)
   readingSkills.cf <- cforest(score ~ ., data = readingSkills,
       control = cforest_unbiased(mtry = 2, ntree = 50))

   # standard importance
   varimp(readingSkills.cf)
   # the same modulo random variation
   varimp(readingSkills.cf, pre1.0_0 = TRUE)

   # conditional importance, may take a while...
   varimp(readingSkills.cf, conditional = TRUE) 




