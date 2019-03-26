## globaldata1.R
## tests to see that nlxb fails if user assumes that workspace
## data for y and tt will be used.

# traceval set TRUE to debug or give full history
traceval  <-  TRUE

# Data for Hobbs problem
ydat  <-  c(5.308, 7.24, 9.638, 12.866, 17.069, 23.192, 31.443, 
          38.558, 50.156, 62.948, 75.995, 91.972) # for testing
y  <-  ydat  # for testing
tdat  <-  seq_along(ydat) # for testing
# WARNING -- using T can get confusion with TRUE
tt  <-  tdat
# A simple starting vector -- must have named parameters for nlxb, nls, wrapnlsr.
start1  <-  c(b1=1, b2=1, b3=1)

eunsc  <-   y ~ b1/(1+b2*exp(-b3*tt))

cat("GLOBAL DATA -- does not work in nlmrt\n")

anls1g  <-  try(nls(eunsc, start=start1, trace=traceval))
print(anls1g)

cat("GLOBAL DATA AND EXPRESSION\n")
anlxb1g  <-  try(nlxb(eunsc, start=start1, trace=traceval))
print(anlxb1g)


