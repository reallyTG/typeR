library(SMUT)


### Name: SMUT
### Title: Multi-SNP Mediation Intersection-Union Test
### Aliases: SMUT

### ** Examples

library(SMUT)
# load the Genotype data included in this R package
data("Genotype_data")

# generate one mediator and one outcome

# first example, the mediation effect is significant
set.seed(1)
beta=rnorm(ncol(Genotype_data),1,2)
e1 = rnorm(nrow(Genotype_data), 0, 1)
mediator = 1 + eigenMapMatMult(Genotype_data,beta) + e1

theta=0.8
gamma=rnorm(ncol(Genotype_data),0.5,2)
e2 = rnorm(nrow(Genotype_data), 0, 1)
outcome = 2 + eigenMapMatMult(Genotype_data,gamma) + theta*mediator + e2

p_value=SMUT(G=Genotype_data,mediator=mediator,outcome=outcome)
print(p_value)

# p_value_IUT is the p value for the mediation effect.
# we have significant(at alpha level 0.05) mediation effects (p_value_IUT = 0.001655787).

# second example, the mediation effect is non-significant
set.seed(1)
beta=rnorm(ncol(Genotype_data),1,2)
e1 = rnorm(nrow(Genotype_data), 0, 1)
mediator = 1 + eigenMapMatMult(Genotype_data,beta) + e1

theta=0
gamma=rnorm(ncol(Genotype_data),0.5,2)
e2 = rnorm(nrow(Genotype_data), 0, 1)
outcome = 2 + eigenMapMatMult(Genotype_data,gamma) + theta*mediator + e2

p_value=SMUT(G=Genotype_data,mediator=mediator,outcome=outcome)
print(p_value)

# p_value_IUT is the p value for the mediation effect.
# we have non-significant(at alpha level 0.05) mediation effects (p_value_IUT = 0.3281677).

# third example, the mediation effect is non-significant
set.seed(1)
beta=rep(0,ncol(Genotype_data))
e1 = rnorm(nrow(Genotype_data), 0, 1)
mediator = 1 + eigenMapMatMult(Genotype_data,beta) + e1

theta=0.8
gamma=rnorm(ncol(Genotype_data),0.5,2)
e2 = rnorm(nrow(Genotype_data), 0, 1)
outcome = 2 + eigenMapMatMult(Genotype_data,gamma) + theta*mediator + e2

p_value=SMUT(G=Genotype_data,mediator=mediator,outcome=outcome)
print(p_value)

# p_value_IUT is the p value for the mediation effect.
# we have non-significant(at alpha level 0.05) mediation effects (p_value_IUT = 0.5596977).

# Thanks for using our R package SMUT ~~



