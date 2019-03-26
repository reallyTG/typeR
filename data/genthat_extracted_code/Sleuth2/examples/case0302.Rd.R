library(Sleuth2)


### Name: case0302
### Title: Agent Orange
### Aliases: case0302
### Keywords: datasets

### ** Examples

str(case0302)
boxplot(Dioxin ~ Veteran, case0302)
t.test(Dioxin ~ Veteran, case0302)
## To examine results with largest dioxin omitted
t.test(Dioxin ~ Veteran, case0302, subset=(Dioxin < 40))



