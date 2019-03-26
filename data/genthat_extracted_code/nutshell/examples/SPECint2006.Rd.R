library(nutshell)


### Name: SPECint2006
### Title: SPECint2006 Results
### Aliases: SPECint2006
### Keywords: datasets

### ** Examples

data(SPECint2006)
t.test(subset(SPECint2006,Num.Chips==1&Num.Cores==2)$Baseline,
       subset(SPECint2006,Num.Chips==1&Num.Cores==2)$Result,
       paired=TRUE)



