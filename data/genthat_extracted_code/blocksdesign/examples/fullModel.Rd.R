library(blocksdesign)


### Name: fullModel
### Title: Full rank model
### Aliases: fullModel

### ** Examples


# Treatments are two 2-level factors A and B and one 3-level factor V
# Required model is A + B + A:B + A:linear(V) + B:linear(V) + quadratic(V)
# The example shows model formula which appear 'correct' but which over-parameterize
# the model. It is 'reasonable' to expect model.matrix to give a full rank model and
# the QR method will ensure that the fitted model is indeed a full rank model. 
# NB The user MUST THEN CHECK to ensure that the fitted model is the required model.  

treatments = expand.grid(A = factor(1:2), B = factor(1:2), V = 1:3)

model = " ~ A * B + poly(V,2) + A:poly(V,1)  + B:poly(V,1)"
model.matrix(as.formula(model),treatments)
fullModel(treatments,model)

model = " ~ (A + B) * poly(V,1) + poly(V,2)  + A:B"
model.matrix(as.formula(model),treatments)
fullModel(treatments,model)




