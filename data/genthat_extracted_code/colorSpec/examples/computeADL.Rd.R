library(colorSpec)


### Name: computeADL
### Title: compute ADL coordinates by ray tracing
### Aliases: computeADL computeADL.colorSpec
### Keywords: colorSpec

### ** Examples

D50.eye = product( D50.5nm, 'varmat', xyz1931.1nm, wave='auto' )
computeADL( D50.eye, c(30,50,70) )
# response.x response.y response.z   ADL.alpha   ADL.delta  ADL.lambda     omega lambda.1 lambda.2
#         30         50         70   0.7364348   0.5384243 473.3909184 0.3008561 427.1431 555.5176
#since alpha < 1, this response is *inside* the object-color solid



