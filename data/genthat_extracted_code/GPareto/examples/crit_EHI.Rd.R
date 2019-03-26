library(GPareto)


### Name: crit_EHI
### Title: Expected Hypervolume Improvement with m objectives
### Aliases: crit_EHI

### ** Examples

#---------------------------------------------------------------------------
# Expected Hypervolume Improvement surface associated with the "P1" problem at a 15 points design
#---------------------------------------------------------------------------
set.seed(25468)
library(DiceDesign)

n_var <- 2 
f_name <- "P1" 
n.grid <- 26
test.grid <- expand.grid(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid))
n_appr <- 15 
design.grid <- round(maximinESE_LHS(lhsDesign(n_appr, n_var, seed = 42)$design)$design, 1)
response.grid <- t(apply(design.grid, 1, f_name))
Front_Pareto <- t(nondominated_points(t(response.grid)))
mf1 <- km(~., design = design.grid, response = response.grid[,1])
mf2 <- km(~., design = design.grid, response = response.grid[,2])

EHI_grid <- crit_EHI(x = as.matrix(test.grid), model = list(mf1, mf2),
         critcontrol = list(refPoint = c(300,0)))

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid), nlevels = 50,
               matrix(EHI_grid, n.grid), main = "Expected Hypervolume Improvement",
               xlab = expression(x[1]), ylab = expression(x[2]), color = terrain.colors, 
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1], design.grid[,2], pch = 21, bg = "white")
                            }
              )



