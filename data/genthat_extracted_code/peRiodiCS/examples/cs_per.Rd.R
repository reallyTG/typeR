library(peRiodiCS)


### Name: cs_per
### Title: Generate design matrix for periodic cubic splines
### Aliases: cs_per

### ** Examples

# load example data; see help("viral_east_mediteranean")
data("viral_east_mediteranean")

# calculate location of knots to use
Knots <- 
 Hmisc::rcspline.eval(x = viral_east_mediteranean$EpiWeek,
                      nk = 5, knots.only = TRUE)

# model viral infections vs weeks
model <- glm(RSV ~ cs_per(EpiWeek, knots = Knots), data = viral_east_mediteranean)

# plot model (with many points, to make it smooth)
plot_per_mod(Model = model, XvarName = "EpiWeek", Smooth = TRUE)




