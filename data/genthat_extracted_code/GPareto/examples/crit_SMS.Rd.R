library(GPareto)


### Name: crit_SMS
### Title: Analytical expression of the SMS-EGO criterion with m>1
###   objectives
### Aliases: crit_SMS

### ** Examples

#---------------------------------------------------------------------------
# SMS-EGO surface associated with the "P1" problem at a 15 points design
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
PF <- t(nondominated_points(t(response.grid)))
mf1 <- km(~., design = design.grid, response = response.grid[,1])
mf2 <- km(~., design = design.grid, response = response.grid[,2])

model <- list(mf1, mf2)
critcontrol <- list(refPoint = c(300, 0), currentHV = dominated_hypervolume(t(PF), c(300, 0)))
SMSEGO_grid <- apply(test.grid, 1, crit_SMS, model = model,
                     paretoFront = PF, critcontrol = critcontrol)

filled.contour(seq(0, 1, length.out = n.grid), seq(0, 1, length.out = n.grid),
               matrix(pmax(0, SMSEGO_grid), nrow = n.grid), nlevels = 50,
               main = "SMS-EGO criterion (positive part)", xlab = expression(x[1]),
               ylab = expression(x[2]), color = terrain.colors,
               plot.axes = {axis(1); axis(2);
                            points(design.grid[,1],design.grid[,2], pch = 21, bg = "white")
                            }
              )



