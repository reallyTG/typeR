## ------------------------------------------------------------------------
require(DrBats)
  
st_data <- drbats.simul(N = 10, 
                 t.range = c(0, 1000),
                 b.range = c(0.2, 0.4),
                 c.range = c(0.6, 0.8),
                 b.sd = 0.5,
                 c.sd = 0.5,
                 y.range = c(-5, 5),
                 sigma2 = 0.2,
                 breaks = 15,
                 data.type = 'sparse.tend')

## ------------------------------------------------------------------------
mycol<-c("#ee204d", "#1f75fe", "#1cac78", "#ff7538", "#b4674d", "#926eae",
                 "#fce883", "#000000", "#78dbe2", "#6e5160", "#ff43a4")

## ------------------------------------------------------------------------
matplot(t(st_data$t), t(st_data$X), type = 'l', lty = 1, lwd = 1, 
        xlab = 'Time', ylab = ' ', col = mycol[1:10])
points(t(st_data$t), t(st_data$X), pch = '.')

## ------------------------------------------------------------------------
matplot(t(st_data$proj.pca$Xt.proj$X.proj), type = 's', lty = 1, lwd = 1, 
        xlab = 'Time', ylab = ' ', col = mycol[1:10])

## ------------------------------------------------------------------------
require(fda)
Canada.temp <- CanadianWeather$monthlyTemp[ , 1:10]

## ------------------------------------------------------------------------
matplot(Canada.temp, type = 'l', xaxt = "n", xlab = "", ylab = "Temp °C",
        col = mycol[1:12])
axis(side = 1, labels = rownames(Canada.temp), at = 1:12)

## ------------------------------------------------------------------------
proj.Canada <- histoProj(t(Canada.temp), 
                         t = t(matrix(rep(1:12, 10), nrow = 12, ncol = 10)), 
                         t.range = c(1, 12), 
                         breaks = 13)$X.proj
rownames(proj.Canada) = colnames(Canada.temp)
colnames(proj.Canada) = rownames(Canada.temp)

## ------------------------------------------------------------------------
matplot(t(proj.Canada), type = 's', lwd = 2, xaxt = "n", col = mycol[1:12])
axis(side = 1, labels = colnames(proj.Canada), at = 1:12)

