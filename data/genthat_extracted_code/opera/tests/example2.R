setwd("~/Documents/Travail/packages/Pour Pierre_yannig/hourly/")
data <- readRDS("Load2.RDS")
models <- readRDS("mod.for.RDS")
dim(data)
dim(models)

source("fonctions_analyse.r")
source("fonctions.r")
n = nrow(models)
Y = tail(data$LOAD,n)
rmse(Y-models[,2])
mape(y = Y,ychap = models[,2])

err = apply(models,2,function(x){mape(Y,x)})
plot(err)

library(opera)
m <- mixture(Y = seriesToBlock(Y,24),experts = seriesToBlock(models,24), model = "MLprod")
plot(m,col = colorRampPalette(c("skyblue2","sienna3"),bias=2)(10), pause = TRUE)
summary(m)

m <- mixture(Y = Y,experts = models, model = "MLprod")
plot(m)
summary(m)


o <- oracle(Y = Y,experts = models)
