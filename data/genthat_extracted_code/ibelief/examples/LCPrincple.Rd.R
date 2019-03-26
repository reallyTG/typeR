library(ibelief)


### Name: LCPrincple
### Title: Least-Committed Principle for creating bbas
### Aliases: LCPrincple

### ** Examples

pro1 = c(0.25, 0.25, 0.25, 0.25);
pro2 = c(0.3, 0.2, 0.2, 0.1);
pro3 = rbind(pro1, pro2);

LCPrincple(pro1)
LCPrincple(pro2)
LCPrincple(pro3)



