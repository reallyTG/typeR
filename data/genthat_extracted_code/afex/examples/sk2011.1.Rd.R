library(afex)


### Name: sk2011.1
### Title: Data from Singmann & Klauer (2011, Experiment 1)
### Aliases: sk2011.1
### Keywords: dataset

### ** Examples

data(sk2011.1)

# Table 1 (p. 264):
aov_ez("id", "response", sk2011.1[ sk2011.1$what == "affirmation",], 
       within = c("inference", "type"), between = "instruction", 
       anova_table=(es = "pes"))
aov_ez("id", "response", sk2011.1[ sk2011.1$what == "denial",], 
       within = c("inference", "type"), between = "instruction", 
       anova_table=(es = "pes"))

 



