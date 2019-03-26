library(rlme)


### Name: fitdvcov
### Title: Fitdvcov
### Aliases: fitdvcov

### ** Examples



# Compare GR and JR methods

data(schools)

model = y ~ 1 + sex + age + (1 | region) + (1 | region:school)

# Extract covariants into matrix
cov = as.matrix(data.frame(schools[,"sex"], schools[,"age"]))

# Fit the models using each method
jr.fit = rlme(model, schools, method="jr")
gr.fit = rlme(model, schools, method="gr")

# Extract beta estimates, ignoring the intercept
jr.beta = jr.fit$fixed.effects$Estimate[c(2, 3)]
gr.beta = gr.fit$fixed.effects$Estimate[c(2, 3)]

# Extract beta variance matrix
var.b = jr.fit$var.b

fitdvcov(cov, jr.beta, gr.beta, var.b)




