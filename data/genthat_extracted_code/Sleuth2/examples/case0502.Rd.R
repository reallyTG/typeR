library(Sleuth2)


### Name: case0502
### Title: The Spock Conspiracy Trial
### Aliases: case0502
### Keywords: datasets

### ** Examples

str(case0502)
boxplot(Percent~Judge, data=case0502,
        xlab="Judge",ylab="Percentage of Women")
percent.spocks <- subset(case0502, Judge == "Spock's", Percent)
percent.others <- subset(case0502, Judge != "Spock's", Percent)
t.test( percent.spocks,percent.others)
summary(aov(Percent~Judge, case0502, subset = Judge != "Spock's"))

#as in Display 5.10
summary(aov(Percent~Judge, case0502))



