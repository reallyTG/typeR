library(SMUT)


### Name: Testing_coefficient_of_mediator
### Title: Testing coefficient of mediator in the outcome model
### Aliases: Testing_coefficient_of_mediator

### ** Examples

library(SMUT)
# load the Genotype data included in this R package
data("Genotype_data")

# generate one mediator and one outcome

set.seed(1)
beta=rnorm(ncol(Genotype_data),1,2)
e1 = rnorm(nrow(Genotype_data), 0, 1)
mediator = 1 + eigenMapMatMult(Genotype_data,beta) + e1

theta=0.8
gamma=rnorm(ncol(Genotype_data),0.5,2)
e2 = rnorm(nrow(Genotype_data), 0, 1)
outcome = 2 + eigenMapMatMult(Genotype_data,gamma) + theta*mediator + e2

p_value=Testing_coefficient_of_mediator(G=Genotype_data,mediator=mediator,outcome=outcome)
print(p_value)

# Thanks for using our R package SMUT ~~



