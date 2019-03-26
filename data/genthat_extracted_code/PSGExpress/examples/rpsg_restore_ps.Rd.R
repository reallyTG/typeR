library(PSGExpress)


### Name: rpsg_restore_ps
### Title: Replace parameters with their values in PSG Problem Statement
### Aliases: rpsg_restore_ps

### ** Examples


#Define PSG Problem Statement:
problem_list<-list()
problem_list$problem_statement <- sprintf(
 "minimize
 cvar_risk(parameter_alpha,matrix_scenarios)
Constraint: >= bound_avg
 avg_g(matrix_scenarios)
Constraint: == bound_lin
 linear(matrix_budget)
Box: >= point_lowerbounds
Solver: solver_van")

#Define parameters:
problem_list$parameter_alpha <-0.95
problem_list$bound_avg <-4.5
problem_list$bound_lin <-1
problem_list$solver_van <-"VAN"

#Convert PSG Problem Statement:

problem_list_new <- rpsg_restore_ps(problem_list)

cat(problem_list_new$problem_statement)




