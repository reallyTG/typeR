library(BSDA)


### Name: Cigarett
### Title: Effect of mother's smoking on birth weight of newborn
### Aliases: Cigarett
### Keywords: datasets

### ** Examples


plot(weight ~ cigarettes, data = Cigarett)
model <- lm(weight ~ cigarettes, data = Cigarett)
abline(model, col = "red")
with(data = Cigarett,
     cor(weight, cigarettes)
)
rm(model)




