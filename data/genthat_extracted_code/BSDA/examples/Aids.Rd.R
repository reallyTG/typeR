library(BSDA)


### Name: Aids
### Title: Incubation times for 295 patients thought to be infected with
###   HIV by a blood transfusion
### Aliases: Aids
### Keywords: datasets

### ** Examples


with(data = Aids,
EDA(duration)
)
with(data = Aids, 
     t.test(duration, mu = 30, alternative = "greater")
)
with(data = Aids, 
     SIGN.test(duration, md = 24, alternative = "greater")
)




