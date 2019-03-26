library(umx)


### Name: umx_residualize
### Title: Easily residualize variables in long or wide dataframes,
###   returning them changed in-place.
### Aliases: umx_residualize

### ** Examples

# Residualize mpg on cylinders and displacement
r1 = umx_residualize("mpg", c("cyl", "disp"), data = mtcars)
r2 = residuals(lm(mpg ~ cyl + disp, data = mtcars, na.action = na.exclude))
all(r1$mpg == r2)
# =====================
# = formula interface =
# =====================
r1 = umx_residualize(mpg ~ cyl + I(cyl^2) + disp, data = mtcars)
r2 = residuals(lm(mpg ~ cyl + I(cyl^2) + disp, data = mtcars, na.action = na.exclude))
all(r1$mpg == r2)

# ========================================================================
# = Demonstrate ability to residualize WIDE data (i.e. 1 family per row) =
# ========================================================================
tmp = mtcars
tmp$mpg_T1  = tmp$mpg_T2  = tmp$mpg
tmp$cyl_T1  = tmp$cyl_T2  = tmp$cyl
tmp$disp_T1 = tmp$disp_T2 = tmp$disp
umx_residualize("mpg", c("cyl", "disp"), c("_T1", "_T2"), data = tmp)[1:5,12:17]

# ===================================
# = Residualize several DVs at once =
# ===================================
df1 = umx_residualize(c("mpg", "hp"), cov = c("cyl", "disp"), data = tmp)
df2 = residuals(lm(hp ~ cyl + disp, data = tmp, na.action = na.exclude))
all(df1$hp == df2)



