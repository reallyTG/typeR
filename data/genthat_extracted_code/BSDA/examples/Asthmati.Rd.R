library(BSDA)


### Name: Asthmati
### Title: Asthmatic relief index on nine subjects given a drug and a
###   placebo
### Aliases: Asthmati
### Keywords: datasets

### ** Examples


qqnorm(Asthmati$difference)
qqline(Asthmati$difference)
shapiro.test(Asthmati$difference)
with(data = Asthmati,
     t.test(placebo, drug, paired = TRUE, mu = 0, alternative = "greater")
)




