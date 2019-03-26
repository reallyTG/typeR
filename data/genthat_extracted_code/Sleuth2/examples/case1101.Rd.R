library(Sleuth2)


### Name: case1101
### Title: Alcohol Metabolism in Men and Women
### Aliases: case1101
### Keywords: datasets

### ** Examples

str(case1101)

plot(Metabol~Gastric, case1101,
     pch=ifelse(Sex=="Female", 19, 21),
     col=ifelse(Alcohol=="Alcoholic", "red", "green"))
legend(1,12, pch=c(19,21,19,21), col=c("green","green", "red", "red"),
             c("Non-alcoholic Females", "Non-alcoholic Males",
               "Alcoholic Females", "Alcoholic Males"))

library(lattice)
xyplot(Metabol~Gastric|Sex*Alcohol, case1101)
xyplot(Metabol~Gastric, case1101, groups=Sex:Alcohol,
        auto.key=list(x=0.2, y=0.8, corner=c(0,0), border=TRUE))



