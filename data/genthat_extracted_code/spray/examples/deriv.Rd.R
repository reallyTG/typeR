library(spray)


### Name: deriv
### Title: Partial differentiation of spray objects
### Aliases: deriv deriv.spray aderiv
### Keywords: mathsymbol

### ** Examples



S <- spray(matrix(sample(-2:2,15,replace=TRUE),ncol=3),addrepeats=TRUE)

deriv(S,1)
deriv(S,2,2)

# differentiation is invariant under order:
aderiv(S,1:3) == deriv(deriv(deriv(S,1,1),2,2),3,3)

# Leibniz's rule:
S1 <- spray(matrix(sample(0:3,replace=TRUE,21),ncol=3),sample(7),addrepeats=TRUE)
S2 <- spray(matrix(sample(0:3,replace=TRUE,15),ncol=3),sample(5),addrepeats=TRUE)

S1*deriv(S2,1) + deriv(S1,1)*S2 == deriv(S1*S2,1)

# Generalized Leibniz:
aderiv(S1*S2,c(1,1,0)) == (
aderiv(S1,c(0,0,0))*aderiv(S2,c(1,1,0)) +
aderiv(S1,c(0,1,0))*aderiv(S2,c(1,0,0)) +
aderiv(S1,c(1,0,0))*aderiv(S2,c(0,1,0)) +
aderiv(S1,c(1,1,0))*aderiv(S2,c(0,0,0)) 
)






