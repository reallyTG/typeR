library(vcd)


### Name: lodds
### Title: Calculate Generalized Log Odds for Frequency Tables
### Aliases: lodds odds lodds.default lodds.formula coef.lodds
###   confint.lodds dim.lodds dimnames.lodds print.lodds vcov.lodds
###   as.matrix.lodds as.array.lodds aperm.lodds t.lodds
###   as.data.frame.lodds
### Keywords: category

### ** Examples

## artificial example
set.seed(1)
x <- matrix(rpois(5 * 3, 7), ncol = 5, nrow = 3)
dimnames(x) <- list(Row = head(letters, 3), Col = tail(letters, 5))

x_lodds <- lodds(x)
coef(x_lodds)
x_lodds
confint(x_lodds)
summary(x_lodds)

### 2 x 2 x k cases
##data(CoalMiners, package = "vcd")
#lor_CM <- loddsratio(CoalMiners)
#lor_CM
#coef(lor_CM)
#confint(lor_CM)
#confint(lor_CM, log = FALSE)
#
### 2 x k x 2
#lor_Emp <-loddsratio(Employment)
#lor_Emp
#confint(lor_Emp)
#
### 4 way tables 
#data(Punishment, package = "vcd")
#lor_pun <- loddsratio(Freq ~ memory + attitude | age + education, data = Punishment)
#lor_pun
#confint(lor_pun)
#summary(lor_pun)
#
## fit linear model using WLS
#lor_pun_df <- as.data.frame(lor_pun)
#pun_mod1 <- lm(LOR ~ as.numeric(age) * as.numeric(education),
#               data = lor_pun_df, weights = 1 / ASE^2)
#anova(pun_mod1)
#
### illustrate ref levels
#VA.fem <- xtabs(Freq ~ left + right, subset=gender=="female", data=VisualAcuity)
#VA.fem
#loddsratio(VA.fem)                  # profile contrasts
#loddsratio(VA.fem, ref=1)           # contrasts against level 1
#loddsratio(VA.fem, ref=dim(VA.fem)) # contrasts against level 4
#




