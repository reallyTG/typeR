library(vcrpart)


### Name: tvcm-plot
### Title: 'plot' method for 'tvcm' objects.
### Aliases: tvcm-plot plot.tvcm panel_coef panel_partdep
### Keywords: hplot

### ** Examples

## ------------------------------------------------------------------- #
## Dummy example:
##
## Plotting the types "coef" and "partdep" for a 'tvcm' object fitted 
## on the artificial data 'vcrpart_2'.
## ------------------------------------------------------------------- # 

data(vcrpart_2)

## fit the model
model <- tvcglm(y ~ vc(z1, z2, by = x1, intercept = TRUE) + x2,
                data = vcrpart_2, family = gaussian(),
                control = tvcm_control(maxwidth = 3, minbucket = 5L))

## plot type "coef"
plot(model, "coef")

## add various (stupid) plot parameters
plot(model, "coef",
     plot_gp = list(type = "p", pch = 2, ylim = c(-4, 4),
       label = c("par1", "par2"), gp = gpar(col = "blue")),
     conf.int_gp = list(angle = 45, length = unit(2, "mm"),
       ends = "last", type = "closed"),
     mean_gp = list(pch = 16,
       gp = gpar(fontsize = 16, cex = 2, col = "red")))

## separate plots with separate plot parameters
plot(model, "coef", parm = list("(Intercept)", "x1"), tnex = 2,
     plot_gp = list(list(gp = gpar(col = "red")),
                    list(gp = gpar(col = "blue"))),
     mean_gp = list(list(gp = gpar(col = "green")),
                    list(gp = gpar(col = "yellow"))))

## plot type "partdep"
par(mfrow = c(1, 2))
plot(model, "partdep", var = "z1", ask = FALSE)



