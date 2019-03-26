library(BSDA)


### Name: Arthriti
### Title: Time of relief for three treatments of arthritis
### Aliases: Arthriti
### Keywords: datasets

### ** Examples


boxplot(time ~ treatment, data = Arthriti, 
col = c("lightblue", "lightgreen", "yellow"),
ylab = "days")
anova(lm(time ~ treatment, data = Arthriti))




