library(IC2)


### Name: curveConcent
### Title: Concentration Curve
### Aliases: curveConcent

### ** Examples

data(hhbudgets)

curveConcent(x=hhbudgets[, "transporte"], y=hhbudgets[,"ingreso"], w=hhbudgets[,"factor"], col="red", xlab="Ranking by income")
curveConcent(x=hhbudgets[, "mantenimiento"], y=hhbudgets[,"ingreso"], w=hhbudgets[,"factor"], col="blue", add=TRUE)
curveConcent(x=hhbudgets[, "publico"], y=hhbudgets[,"ingreso"], w=hhbudgets[,"factor"], col="green", add=TRUE)
title(main="Transport expenditures")
legend("topleft", legend = c("All transport", "Private: Maintenance and repair", "Public transport"), col=c("red", "blue", "green"), lty=rep(1, 3))



