library(rcompanion)


### Name: freemanTheta
### Title: Freeman's theta
### Aliases: freemanTheta

### ** Examples

data(Breakfast)
library(coin)
chisq_test(Breakfast, scores = list("Breakfast" = c(-2, -1, 0, 1, 2)))
freemanTheta(Breakfast)

### Example from Freeman (1965), Table 10.6
Counts = c(1,2,5,2,0,10,5,5,0,0,0,0,2,2,1,0,0,0,2,3)
Matrix = matrix(Counts, byrow=TRUE, ncol=5,
               dimnames = list(Marital.status=c("Single","Married","Widowed",
                                                "Divorced"),
                               Social.adjustment = c("5","4","3","2","1")))
Matrix
freemanTheta(Matrix)

### Example after Kruskal Wallis test
data(PoohPiglet)
kruskal.test(Likert ~ Speaker, data = PoohPiglet)
freemanTheta(x = PoohPiglet$Likert, g = PoohPiglet$Speaker)

### Same data, as table of counts
data(PoohPiglet)
XT = xtabs( ~ Speaker + Likert , data = PoohPiglet)
freemanTheta(XT)




