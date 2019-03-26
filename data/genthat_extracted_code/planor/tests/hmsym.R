library("planor")
set.seed(114)
# Rprof(filename = "Rprof.out",line.profiling = TRUE)
test.designkey <- planor.designkey(factors=10, nlev=3, resolution=5, nunits=3^7, randomsearch=TRUE, base=~A+B+C+D+E+F+G)
# Rprof(NULL)
print(test.designkey)
# R CMD Rprof --lines Rprof.out
