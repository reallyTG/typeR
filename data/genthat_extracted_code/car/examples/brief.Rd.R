library(car)


### Name: brief
### Title: Print Abbreviated Ouput
### Aliases: brief brief.data.frame brief.matrix brief.numeric
###   brief.integer brief.character brief.factor brief.function brief.list
###   brief.lm brief.glm brief.multinom brief.polr brief.default
### Keywords: manip

### ** Examples

brief(rnorm(100))
brief(Duncan)
brief(OBrienKaiser, elided=TRUE)
brief(matrix(1:500, 10, 50))
brief(lm)

mod.prestige <- lm(prestige ~ education + income + type, Prestige)
brief(mod.prestige, pvalues=TRUE)
brief(mod.prestige, ~ type)
mod.mroz <- glm(lfp ~ ., data=Mroz, family=binomial)
brief(mod.mroz)



