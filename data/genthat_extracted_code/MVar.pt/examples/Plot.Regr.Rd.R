library(MVar.pt)


### Name: Plot.Regr
### Title: Graficos dos resultados da regressao linear.
### Aliases: Plot.Regr
### Keywords: Regressao

### ** Examples

data(DataMix)

Y <- DataMix[,2]

X <- DataMix[,7]

NomeY <- "Media das notas"

NomeX <- "Cafes comerciais"

Res <- Regr(Y, X, NameVarX = NomeX ,Intercepts = TRUE, SigF = 0.05)

Tit <- c("Scatterplot")
Plot.Regr(Res, TypeGraf = "Scatterplot", Title = Tit,
          NameVarY = NomeY, NameVarX = NomeX, Color = TRUE)

Tit <- c("Grafico de Dispersao com a \n reta ajustada")
Plot.Regr(Res, TypeGraf = "Regression", Title = Tit, 
          xlabel = NomeX, ylabel = NomeY, Color = TRUE,
          IntConf = TRUE, IntPrev = TRUE)

dev.new() # necessario para nao sobrepor os graficos seguintes ao grafico anterior

par(mfrow = c(2,2)) 

Plot.Regr(Res, TypeGraf = "QQPlot", Casc = FALSE)
Plot.Regr(Res, TypeGraf = "Histogram", Casc = FALSE)
Plot.Regr(Res, TypeGraf = "Fits", Casc = FALSE)
Plot.Regr(Res, TypeGraf = "Order", Casc = FALSE)



