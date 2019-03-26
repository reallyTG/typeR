library(oddsratio)


### Name: insert_or
### Title: Insert odds ratios of GAM(M)s into smoothing function
### Aliases: insert_or

### ** Examples

# load data (Source: ?mgcv::gam) and fit model
library(mgcv)
fit_gam <- gam(y ~ s(x0) + s(I(x1^2)) + s(x2) +
               offset(x3) + x4, data = data_gam) # fit model

# create input objects (plot + odds ratios)
library(oddsratio)
plot_object <- plot_gam(fit_gam, pred = "x2", title = "Predictor 'x2'")
or_object1 <- or_gam(data = data_gam, model = fit_gam,
                     pred = "x2", values = c(0.099, 0.198))

# insert first odds ratios to plot
plot_object <- insert_or(plot_object, or_object1, or_yloc = 3,
                         values_xloc = 0.04, line_size = 0.5,
                         line_type = "dotdash", text_size = 6,
                         values_yloc = 0.5, arrow_col = "red")

# calculate second odds ratio
or_object2 <- or_gam(data = data_gam, model = fit_gam, pred = "x2",
                     values = c(0.4, 0.6))

# add or_object2 into plot
insert_or(plot_object, or_object2, or_yloc = 2.1, values_yloc = 2,
          line_col = "green4", text_col = "black",
          rect_col = "green4", rect_alpha = 0.2,
          line_alpha = 1, line_type = "dashed",
          arrow_xloc_r = 0.01, arrow_xloc_l = -0.01,
          arrow_length = 0.01, rect = TRUE)



