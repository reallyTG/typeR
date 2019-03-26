library(ltm)


### Name: person.fit
### Title: Person-Fit Statistics and P-values
### Aliases: person.fit
### Keywords: multivariate

### ** Examples


# person-fit statistics for the Rasch model
# for the Abortion data-set
person.fit(rasch(Abortion))

# person-fit statistics for the two-parameter logistic model
# for the LSAT data-set
person.fit(ltm(LSAT ~ z1), simulate.p.value = TRUE, B = 100)




