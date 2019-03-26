library(Compind)


### Name: ci_mpi
### Title: Mazziotta-Pareto Index (MPI) method
### Aliases: ci_mpi

### ** Examples

data(EU_NUTS1)

# Please, pay attention. MPI can be calculated only with two standardizations methods:
# Classic MPI - method=1, z.mean=100 and z.std=10
# Correct MPI - method=2
# For more info, please see references.

data_norm = normalise_ci(EU_NUTS1,c(2:3),c("NEG","POS"),method=1,z.mean=100, z.std=10)
CI = ci_mpi(data_norm$ci_norm, penalty="NEG")

data(EU_NUTS1)
CI = ci_mpi(EU_NUTS1,c(2:3),penalty="NEG")



