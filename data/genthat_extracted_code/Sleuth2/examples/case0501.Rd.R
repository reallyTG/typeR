library(Sleuth2)


### Name: case0501
### Title: Diet Restriction and Longevity
### Aliases: case0501
### Keywords: datasets

### ** Examples

str(case0501)
boxplot(Lifetime~Diet, width=c(rep(.8,6)), data=case0501,
        xlab="Diet", ylab="Lifetime in months")
summary(subset(case0501, Diet=="NP", Lifetime))



