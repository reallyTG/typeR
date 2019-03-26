library(kitagawa)


### Name: alpha_constants
### Title: Calculate any constants depending on effective stress
###   coefficient alpha
### Aliases: alpha_constants alpha_constants.default

### ** Examples

alpha_constants()   # kelvin::Keir gives warning
alpha_constants(1)  # defaults to constant 'Phi' (note output also has Kel)
alpha_constants(1:10, c.type="A")  # constant 'A' (again, note output)



