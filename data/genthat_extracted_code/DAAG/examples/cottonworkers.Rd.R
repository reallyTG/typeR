library(DAAG)


### Name: cottonworkers
### Title: Occupation and wage profiles of British cotton workers
### Aliases: cottonworkers
### Keywords: datasets

### ** Examples

data(cottonworkers)
str(cottonworkers)
plot(survey1889 ~ census1886, data=cottonworkers)
plot(I(avwage*survey1889) ~ I(avwage*census1886), data=cottonworkers)



