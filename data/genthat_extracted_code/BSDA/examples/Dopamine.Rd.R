library(BSDA)


### Name: Dopamine
### Title: Dopamine b-hydroxylase activity of schizophrenic patients
###   treated with an antipsychotic drug
### Aliases: Dopamine
### Keywords: datasets

### ** Examples


boxplot(dbh ~ group, data = Dopamine, col = "orange")
t.test(dbh ~ group, data = Dopamine, var.equal = TRUE)




