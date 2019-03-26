library(TapeR)


### Name: TapeR_FIT_LME.f
### Title: Fits a taper curve model to the specified diameter-height data.
### Aliases: TapeR_FIT_LME.f

### ** Examples

#load example data
data(DxHx.df)

#prepare the data (could be defined in the function directly)
Id = DxHx.df[,"Id"]
x = DxHx.df[,"Hx"]/DxHx.df[,"Ht"]#calculate relative heights
y = DxHx.df[,"Dx"]

#define the relative knot positions and order of splines
knt_x = c(0.0, 0.1, 0.75, 1.0);	ord_x = 4 # B-Spline knots: fix effects; order (cubic = 4)
knt_z = c(0.0, 0.1       ,1.0); ord_z = 4 # B-Spline knots: rnd effects

#fit the model
taper.model <- TapeR_FIT_LME.f(Id, x, y, knt_x, ord_x, knt_z, ord_z,
IdKOVb = "pdSymm")

#save model parameters for documentation or dissimination
#parameters can be load()-ed and used to predict the taper 
#or volume using one or several measured dbh
spruce.taper.pars <- taper.model$par.lme
save(spruce.taper.pars, file="spruce.taper.pars.rdata")



