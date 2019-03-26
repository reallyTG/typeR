library(cna)


### Name: selectCases
### Title: Select the cases/configurations that are compatible with a data
###   generating causal structure
### Aliases: selectCases selectCases1

### ** Examples

# Generate all configurations of 5 dichotomous factors that are compatible with the causal
# chain (A*b + a*B <-> C) * (C*d + c*D <-> E).
dat1 <- allCombs(c(2, 2, 2, 2, 2)) - 1
(dat2 <- selectCases("(A*b + a*B <-> C) * (C*d + c*D <-> E)", dat1))
condition("(A*b + a*B <-> C) * (C*d + c*D <-> E)", dat2)

# Generate all configurations of 5 multi-value factors that are compatible with the causal
# chain (A=2*B=1 + A=3*B=3 <-> C=1) * (C=1*D=2 + C=4*D=4 <-> E=3).
dat1 <- allCombs(c(3, 3, 4, 4, 3))
(dat2 <- selectCases("(A=2*B=1 + A=3*B=3 <-> C=1) * (C=1*D=2 + C=4*D=4 <-> E=3)", dat1,
                      type = "mv"))
condition("(A=2*B=1 + A=3*B=3 <-> C=1) * (C=1*D=2 + C=4*D=4 <-> E=3)", dat2)

# Generate all configurations of 5 fuzzy-set factors that are compatible with the causal
# structure A*b + C*D <-> E, such that con = .8 and cov = .8.
dat1 <- allCombs(c(2, 2, 2, 2, 2)) - 1
dat2 <- makeFuzzy(dat1, fuzzvalues = seq(0, 0.45, 0.01))
(dat3 <- selectCases1("A*b + C*D <-> E", con = .8, cov = .8, dat2))
condition("A*b + C*D <-> E", dat3)

# Inverse search for the data generating causal structure A*b + a*B + C*D <-> E from
# fuzzy-set data with non-perfect consistency and coverage scores.
dat1 <- allCombs(c(2, 2, 2, 2, 2)) - 1
set.seed(9)
dat2 <- makeFuzzy(dat1, fuzzvalues = 0:4/10)
dat3 <- selectCases1("A*b + a*B + C*D <-> E", con = .8, cov = .8, dat2)
fscna(dat3, ordering = list("E"), strict = TRUE, con = .8, cov = .8)

# Draw cases satisfying specific conditions from real-life fuzzy-set data.
tt.js <- fstt(d.jobsecurity)
selectCases("S -> C", tt.js)  # Cases with higher membership scores in C than in S.
selectCases("S -> C", d.jobsecurity, type = "fs")  # Same.
selectCases("S <-> C", tt.js) # Cases with identical membership scores in C and in S.
selectCases1("S -> C", con = .8, cov = .8, tt.js)  # selectCases1 makes no distinction 
              #  between "->" and "<->".
condition("S -> C", selectCases1("S -> C", con = .8, cov = .8, tt.js))

# selectCases not only draws cases compatible with Boolean causal models. Any Boolean or 
# set-theoretic function can be given as cond.
selectCases("C > B", allCombs(2:4), type = "mv")
selectCases("C=2 | B!=3", allCombs(2:4), type = "mv")
selectCases("A=1 * !(C=2 + B!=3)", allCombs(2:4), type = "mv")



