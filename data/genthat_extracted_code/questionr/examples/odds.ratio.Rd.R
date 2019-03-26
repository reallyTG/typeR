library(questionr)


### Name: odds.ratio
### Title: Odds Ratio
### Aliases: odds.ratio odds.ratio.glm odds.ratio.multinom
###   odds.ratio.factor odds.ratio.table odds.ratio.matrix
###   odds.ratio.numeric print.odds.ratio

### ** Examples

data(hdv2003)
reg <- glm(cinema ~ sexe + age, data=hdv2003, family=binomial)
odds.ratio(reg)
odds.ratio(hdv2003$sport, hdv2003$cuisine)
odds.ratio(table(hdv2003$sport, hdv2003$cuisine))
M <- matrix(c(759, 360, 518, 363), ncol = 2)
odds.ratio(M)
odds.ratio(0.26, 0.42)



