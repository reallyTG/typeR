library(PSGExpress)


### Name: rpsg_solver
### Title: solves optimization problem using General (Text) Format of PSG
### Aliases: rpsg_solver

### ** Examples

#Problem of CVaR minimization with constraint on the mean profit:
#Find x = (x1,x2,x3,x4) minimizing
#risk(x) = CVaR(0.95,x)
#subject to
#Average Gain(x)>4.5
#x1+x2+x3+x4 = 1
#x1>=0, x2>=0, x3>=0, x4>=0

matrix_scenarios <- matrix(c(1,4,8,3, 7,5,4,6, 2,8,1,0,0,3,4,9),nrow=4, byrow=TRUE)
colnames(matrix_scenarios) <- colnames(matrix_scenarios,do.NULL = FALSE, prefix = "x")
scenario_benchmark <- c(0.2, 0.11, 0.6, 0.1)
matrix_scenarios <- cbind(matrix_scenarios,scenario_benchmark)
matrix_budget <- matrix(c(1, 1, 1, 1),nrow=1)
colnames(matrix_budget) <- colnames(matrix_budget,do.NULL = FALSE, prefix = "x")
point_lowerbounds <- c(0, 0, 0, 0)
names(point_lowerbounds) <- rownames(point_lowerbounds,do.NULL = FALSE, prefix = "x")

# Case 1. PSG data is saved in list
problem_list <- list()

#Problem Statement
problem_list$problem_statement <- sprintf(
 "minimize
 cvar_risk(0.95,matrix_scenarios)
Constraint: >= 4.5
 avg_g(matrix_scenarios)
Constraint: == 1
 linear(matrix_budget)
Box: >= point_lowerbounds")

# PSG Matrix:
problem_list$matrix_scenarios <- matrix_scenarios

# PSG Matrix:
problem_list$matrix_budget <- matrix_budget

# PSG Point:
problem_list$point_lowerbounds <- point_lowerbounds

# Solve optimization problem
output.list.1 <- rpsg_solver(problem_list)

print(output.list.1)

# Case 2. PSG data is saved in Global Environment
problem_list <- list()

#Problem Statement
problem_list$problem_statement <- sprintf(
 "minimize
 cvar_risk(0.95,matrix_scenarios)
Constraint: >= 4.5
 avg_g(matrix_scenarios)
Constraint: == 1
 linear(matrix_budget)
Box: >= point_lowerbounds")

output.list.2 <- rpsg_solver(problem_list)

print(output.list.2)





