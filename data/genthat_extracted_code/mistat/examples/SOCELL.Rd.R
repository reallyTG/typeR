library(mistat)


### Name: SOCELL
### Title: Short Circuit Current of Solar Cells
### Aliases: SOCELL
### Keywords: datasets

### ** Examples

data(SOCELL)

LmISC <- lm(t2 ~ 1 + t1, 
            data=SOCELL)

summary(LmISC)



