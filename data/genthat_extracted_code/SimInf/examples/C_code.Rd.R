library(SimInf)


### Name: C_code
### Title: Extract the C code from a 'SimInf_model' object
### Aliases: C_code

### ** Examples

## Use the model parser to create a 'SimInf_model' object that
## expresses an SIR model, where 'b' is the transmission rate and
## 'g' is the recovery rate.
model <- mparse(transitions = c("S -> b*S*I/(S+I+R) -> I", "I -> g*I -> R"),
                compartments = c("S", "I", "R"),
                gdata = c(b = 0.16, g = 0.077),
                u0 = data.frame(S = 99, I = 1, R = 0),
                tspan = 1:10)

## View the C code.
C_code(model)

## Modify the C code for a package named "XYZ"
C_code(model, "XYZ")



