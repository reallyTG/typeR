library(Sleuth2)


### Name: case0602
### Title: Mate Preference of Platyfish
### Aliases: case0602
### Keywords: datasets

### ** Examples

str(case0602)
boxplot(Proportion~Pair, case0602, ylab="Proportion")

#as in Display 6.5 
summary(aov(Proportion~Pair, case0602))

n.fish  <- with(case0602, tapply(Proportion, Pair, length))
av.fish <- with(case0602, tapply(Proportion, Pair, mean))
sd.fish <- with(case0602, tapply(Proportion, Pair, sd))
male.body.size <- with(case0602, tapply(Length, Pair, unique))
mean.body <- mean(male.body.size)
table.fish <- data.frame(n.fish, round(av.fish*100,2),
                         round(sd.fish*100,2), male.body.size,
                         2*(male.body.size-mean.body))
names(table.fish) <- c("n", "average", "sd", "male.body.size", "coefficient")
s.pooled <- with(table.fish, round(sqrt(sum(sd^2*(n-1))/sum(n-1)),2))
g <- with(table.fish, sum(average*coefficient))
se.g <- with(table.fish, round(s.pooled*sqrt(sum(coefficient^2/n)),2))
g/se.g



