library(BSDA)


### Name: Remedial
### Title: Math placement test score for 35 freshmen females and 42
###   freshmen males
### Aliases: Remedial
### Keywords: datasets

### ** Examples


boxplot(score ~ gender, data = Remedial, 
col = c("purple", "blue"))
t.test(score ~ gender, data = Remedial, conf.level = 0.98)
t.test(score ~ gender, data = Remedial, conf.level = 0.98)$conf
wilcox.test(score ~ gender, data = Remedial, 
            conf.int = TRUE, conf.level = 0.98)




