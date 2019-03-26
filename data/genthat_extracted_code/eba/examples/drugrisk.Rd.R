library(eba)


### Name: drugrisk
### Title: Perceived Health Risk of Drugs
### Aliases: drugrisk
### Keywords: datasets

### ** Examples

data(drugrisk)

## Bradley-Terry-Luce (BTL) model
btl <- eba(drugrisk[, , group = "male30"])

## Elimination-by-aspects (EBA) model, 1 additional aspect
A1 <- list(c(1), c(2,7), c(3,7), c(4,7), c(5,7), c (6,7))
eba1 <- eba(drugrisk[, , group = "male30"], A1)

## EBA model, 2 additional aspects
A2 <- list(c(1), c(2,7), c(3,7), c(4,7,8), c(5,7,8), c(6,7,8))
eba2 <- eba(drugrisk[, , group = "male30"], A2)

## Model selection
anova(btl, eba1, eba2)

## Utility scale values (BTL for females, EBA for males)
dotchart(cbind(
  apply(drugrisk[,,1:2], 3, function(x) uscale(eba(x),     norm=1, log=TRUE)),
  apply(drugrisk[,,3:4], 3, function(x) uscale(eba(x, A2), norm=1, log=TRUE))
  ), xlab="log[ Utility scale value (BTL and EBA models) ]",
     main="Perceived health risk of drugs")
abline(v=0, col="gray")
mtext("(Wickelmaier, 2008)", line=.5)



