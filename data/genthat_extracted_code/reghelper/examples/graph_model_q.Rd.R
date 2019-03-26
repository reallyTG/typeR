library(reghelper)


### Name: graph_model_q
### Title: Graph interactions for fitted models.
### Aliases: graph_model_q graph_model_q.lm graph_model_q.aov
###   graph_model_q.glm graph_model_q.lme graph_model_q.merMod

### ** Examples

# iris data
model <- lm(Sepal.Width ~ Sepal.Length * Species, data=iris)
graph_model(model, y=Sepal.Width, x=Sepal.Length, lines=Species)

# Orthodont data
if (require(nlme, quietly=TRUE)) {
    model <- lme(distance ~ age * Sex, data=Orthodont, random=~1|Subject)
    graph_model(model, y=distance, x=age, lines=Sex)
}

# Arabidopsis data
if (require(lme4, quietly=TRUE)) {
    model <- lmer(total.fruits ~ nutrient * amd + rack + (1|gen), data=Arabidopsis)
    graph_model(model, y=total.fruits, x=nutrient, lines=amd)
}



