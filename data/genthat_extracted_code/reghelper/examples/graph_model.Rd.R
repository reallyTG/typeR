library(reghelper)


### Name: graph_model
### Title: Graph interactions for fitted models.
### Aliases: graph_model graph_model.lm graph_model.aov graph_model.glm
###   graph_model.lme graph_model.merMod

### ** Examples

# iris data
model <- lm(Sepal.Width ~ Sepal.Length * Species, data=iris)
graph_model_q(model, y='Sepal.Width', x='Sepal.Length', lines='Species')

# Orthodont data
if (require(nlme, quietly=TRUE)) {
    model <- lme(distance ~ age * Sex, data=Orthodont, random=~1|Subject)
    graph_model_q(model, y='distance', x='age', lines='Sex')
}

# Arabidopsis data
if (require(lme4, quietly=TRUE)) {
    model <- lmer(total.fruits ~ nutrient * amd + rack + (1|gen), data=Arabidopsis)
    graph_model_q(model, y='total.fruits', x='nutrient', lines='amd')
}



