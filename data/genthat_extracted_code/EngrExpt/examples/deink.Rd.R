library(EngrExpt)


### Name: deink
### Title: De-inking of newsprint
### Aliases: deink
### Keywords: datasets

### ** Examples

str(deink)
xtabs(~ alkali + hardness, deink)
dotplot(hardness ~ bright, deink, groups = alkali,
        auto.key = list(columns = 3, lines = TRUE),
        type = c("p","a"), aspect = 'xy',
        xlab = "Brightness by amount of alkali",
        ylab = "Hardness of the water")



