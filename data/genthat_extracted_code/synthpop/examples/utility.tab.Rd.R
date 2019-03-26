library(synthpop)


### Name: utility.tab
### Title: Tabular utility
### Aliases: utility.tab print.utility.tab

### ** Examples

ods <- SD2011[1:1000, c("sex", "age", "edu", "marital")]

s1 <- syn(ods, m = 10)
utility.tab(s1, ods, vars = c("marital", "sex"))

s2 <- syn(ods, m = 1)
utility.tab(s2, ods, vars = c("marital", "age"), ngroups = 3, print.tables = TRUE)
u2 <- utility.tab(s2, ods, vars = c("marital", "age"), style = "pretty")
print(u2, print.tables = TRUE, print.zdiff = TRUE)



