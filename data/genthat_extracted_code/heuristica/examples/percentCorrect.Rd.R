library(heuristica)


### Name: percentCorrect
### Title: Percent correct of heuristics' predictPair on test_data.
### Aliases: percentCorrect

### ** Examples

df <- data.frame(y=c(30,20,10,5), name=c("a", "b", "c", "d"),
                 x1=c(1,1,0,0), x2=c(1,1,0,1))
ttb <- ttbModel(df, 1, c(3:4))
sing <- singleCueModel(df, 1, c(3:4))
percentCorrect(df, ttb, sing)
#    ttbModel singleCueModel
#  1     0.75      0.8333333
# TTB gets 75% correct while single cue model gets 83%.

# Now repeatedly sample 2 rows of the data set and see how outcomes are
# affected, tracking with the fit_name.
set.seed(1) # If you want to reproduce the same output as below.
ttb1 <- ttbModel(df[sample(nrow(df), 2),], 1, c(3:4), fit_name="fit1")
ttb2 <- ttbModel(df[sample(nrow(df), 2),], 1, c(3:4), fit_name="fit2")
ttb3 <- ttbModel(df[sample(nrow(df), 2),], 1, c(3:4), fit_name="fit3")
percentCorrect(df, ttb1, ttb2, ttb3)
#        fit1 fit2 fit3
# 1 0.8333333 0.75 0.75




