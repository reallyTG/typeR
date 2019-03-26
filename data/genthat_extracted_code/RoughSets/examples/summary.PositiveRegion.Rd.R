library(RoughSets)


### Name: summary.PositiveRegion
### Title: The summary function of positive region based on RST and FRST
### Aliases: summary.PositiveRegion

### ** Examples

dt.ex1 <- data.frame(c(1,0,2,1,1,2,2,0), c(0, 1,0, 1,0,2,1,1),
                        c(2,1,0,0,2,0,1,1), c(2,1,1,2,0,1,1,0), c(0,2,1,2,1,1,2,1))
colnames(dt.ex1) <- c("aa", "bb", "cc", "dd", "ee")
decision.table <- SF.asDecisionTable(dataset = dt.ex1, decision.attr = 5,
                                    indx.nominal = c(1:5))

## in this case, we consider second and third attributes only
P <- c(2,3)

####### Perform indiscernibility relation #######
IND <- BC.IND.relation.RST(decision.table, feature.set = P)

####### Perform lower and upper approximations #####
roughset <- BC.LU.approximation.RST(decision.table, IND)

####### Determine the positive region ######
region <- BC.positive.reg.RST(decision.table, roughset)

summary(region)



