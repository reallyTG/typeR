library(GPareto)


### Name: crit_EMI
### Title: Expected Maximin Improvement with m objectives
### Aliases: crit_EMI

### ** Examples

#---------------------------------------------------------------------------
# Expected Maximin Improvement surface associated with the "P1" problem at a 15 points design
#---------------------------------------------------------------------------
set.seed(25468)
library(DiceDesign)

n_var <- 2 
f_name <- "P1" 
n.grid <- 21
test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
n_appr <- 15 
design.grid <- round(maximinESE_LHS(lhsDesign(n_appr, n_var, seed = 42)$design)$design, 1)
response.grid <- t(apply(design.grid, 1, f_name))
Front_Pareto <- t(nondominated_points(t(response.grid)))
mf1 <- km(~., design = design.grid, response = response.grid[,1])
mf2 <- km(~., design = design.grid, response = response.grid[,2])

EMI_grid <- apply(test.grid, 1, crit_EMI, model = list(mf1, mf2), paretoFront = Front_Pareto,
                     critcontrol = list(nb_samp = 20))

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(EMI_grid, nrow = n.grid), main = "Expected Maximin Improvement",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            }
              )



