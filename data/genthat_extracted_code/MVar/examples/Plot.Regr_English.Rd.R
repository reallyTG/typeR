library(MVar)


### Name: Plot.Regr
### Title: Graphs of the linear regression results.
### Aliases: Plot.Regr
### Keywords: Regression

### ** Examples

data(DataMix)

Y <- DataMix[,2]

X <- DataMix[,7]

NomeY <- "Medium grade"

NomeX <- "Commercial coffees"

Res <- Regr(Y, X, NameVarX = NomeX , Intercepts = TRUE, SigF = 0.05)

Tit <- c("Scatterplot")
Plot.Regr(Res, TypeGraf = "Scatterplot", Title = Tit,
          NameVarY = NomeY, NameVarX = NomeX, Color = TRUE)

Tit <- c("Scatterplot with the adjusted line")
Plot.Regr(Res, TypeGraf = "Regression", Title = Tit, 
          xlabel = NomeX, ylabel = NomeY, Color = TRUE,
          IntConf = TRUE, IntPrev = TRUE)

dev.new() # necessary to not overlap the following graphs to the previous graph

par(mfrow = c(2,2)) 

Plot.Regr(Res, TypeGraf = "QQPlot", Casc = FALSE)
Plot.Regr(Res, TypeGraf = "Histogram", Casc = FALSE)
Plot.Regr(Res, TypeGraf = "Fits", Casc = FALSE)
Plot.Regr(Res, TypeGraf = "Order", Casc = FALSE)



