library(descr)


### Name: compmeans
### Title: Means of a numerical vector according to a factor
### Aliases: compmeans

### ** Examples

sex <- factor(c(rep("F", 900), rep("M", 900)))
income <- 100 * (rnorm(1800) + 5)
weight <- rep(1, 1800)
weight[sex == "F" & income > 500] <- 3
attr(income, "label") <- "Income"
attr(sex, "label") <- "Sex"
compmeans(income, sex, col = "lightgray", ylab = "income", xlab = "sex")
comp <- compmeans(income, sex, weight, plot = FALSE)
plot(comp, col = c("pink", "lightblue"), ylab = "income", xlab = "sex")

library(xtable)
# If the decimal separator in your country is a comma:
# options(OutDec = ",")
print(xtable(comp, caption = "Income according to sex", label = "tab:incsx"))



