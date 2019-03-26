library(PASWR2)


### Name: EURD
### Title: European Union Research and Development
### Aliases: EURD
### Keywords: datasets

### ** Examples

ggplot(data = EURD, aes(x = rd2002, y =  rd2003)) + geom_point() +
geom_smooth(method = "lm")
ggplot(data = EURD, aes(sample = rd2003 - rd2002)) + stat_qq()
# lattice approach
qqmath(~ (rd2003 - rd2002), data = EURD, type =c("p", "r"))



