library(glmx)


### Name: MexicanLabor
### Title: Mexican Women's Labor-Force Participation
### Aliases: MexicanLabor
### Keywords: datasets

### ** Examples

## data
data("MexicanLabor", package = "glmx")

## visualizations
plot(I(laborforce/total) ~ interaction(income, age), data = MexicanLabor)
plot(I(laborforce/total) ~ interaction(schooling, locality), data = MexicanLabor)

## simple logit model
m <- glm(cbind(laborforce, total - laborforce) ~ ., data = MexicanLabor, family = binomial)
summary(m)



