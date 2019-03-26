library(PSGExpress)


### Name: rpsg_riskratioprog
### Title: Maximizes ratio of risk functions with linear constraints
### Aliases: rpsg_riskratioprog

### ** Examples

#Problem:
#Find x = (x1,x2,x3,x4) maximizing
#f(x) = Average Gain(x)/Partial Moment Penalty for Loss(x)
#subject to
#x1+x2+x3+x4+x5 = 1
#x1+x3 <= 0.6
#x2+x4+x5 <= 0.5
#0 <= x1 <= 0.5, 0 <= x2 <= 0.5, 0.3 <= x3 <= 0.5, 0 <= x4 <= 0.5, 0 <= x5 <= 0.5

input.model <- list()
input.model$risk1 <- "pm_pen"
input.model$w1 <- 0.01
input.model$risk2 <- "avg"
H1 <- c(0.11, 0.04, -0.12, 0.01, -0.05,
       -0.01, -0.1, 0.03, 0.21, 0.01,
       0.05, 0.2, 0.07, -0.03, -0.12,
       -0.1, 0.14, 0.04, -0.1, 0.09,
       0.08, -0.02, -0.2, 0.07, -0.01,
       0.17, 0.3, -0.12, -0.02, 0.08)
input.model$H1 <- matrix(H1,ncol = 5,byrow = TRUE)
input.model$c1 <- c(0.06, -0.1, 0.12, 0.01, -0.06, 0.11)
input.model$H2 <- input.model$H1
input.model$c2 <- input.model$c1
input.model$Aineq <- matrix(c(1,0, 1, 0, 0, 0, 1, 0, 1, 1),ncol = 5,byrow = TRUE)
input.model$bineq <- c(0.6, 0.5)
input.model$Aeq <- matrix(c(1.0, 1.0, 1.0, 1.0, 1.0),nrow = 1)
input.model$beq <- 1.0
input.model$lb <- c(0.0, 0.0, 0.3, 0.0, 0.0)
input.model$ub <- c(0.5, 0.5, 0.5, 0.5, 0.5)

options<-list()
options$solver <- "van"
options$precision <- 7

results <- rpsg_riskratioprog(input.model,options)

print(results)




