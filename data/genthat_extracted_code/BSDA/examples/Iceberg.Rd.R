library(BSDA)


### Name: Iceberg
### Title: Number of icebergs sighted each month south of Newfoundland and
###   south of the Grand Banks in 1920
### Aliases: Iceberg
### Keywords: datasets

### ** Examples


plot(Newfoundland ~ `Grand Banks`, data = Iceberg)
abline(lm(Newfoundland ~ `Grand Banks`, data = Iceberg), col = "blue")




