library(BSDA)


### Name: Rehab
### Title: Rehabilitative potential of 20 prison inmates as judged by two
###   psychiatrists
### Aliases: Rehab
### Keywords: datasets

### ** Examples


boxplot(Rehab$differ)
qqnorm(Rehab$differ)
qqline(Rehab$differ)
t.test(Rehab$differ)
# Or
t.test(Rehab$psych1, Rehab$psych2, paired = TRUE)




