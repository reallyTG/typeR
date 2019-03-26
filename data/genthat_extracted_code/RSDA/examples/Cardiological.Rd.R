library(RSDA)


### Name: Cardiological
### Title: Cardiological data example
### Aliases: Cardiological
### Keywords: datasets

### ** Examples

data(Cardiological)
car.data <- Cardiological
res.cm <- sym.lm(Pulse~Syst+Diast,sym.data=car.data,method='cm')
pred.cm <- predictsym.lm(res.cm,car.data,method='cm')
RMSE.L(sym.var(car.data,1),pred.cm$Fitted)
RMSE.U(sym.var(car.data,1),pred.cm$Fitted)
R2.L(sym.var(car.data,1),pred.cm$Fitted)
R2.U(sym.var(car.data,1),pred.cm$Fitted)
deter.coefficient(sym.var(car.data,1),pred.cm$Fitted)



