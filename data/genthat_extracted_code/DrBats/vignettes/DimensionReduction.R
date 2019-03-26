## ---- echo = F-----------------------------------------------------------
rm(list = ls())

## ---- messages = F-------------------------------------------------------
require(DrBats)
require(ggplot2)
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
eigenval <- st_data$proj.pca$lambda.perc
barplot(eigenval, ylim = c(0, 1), col = mycol[1:length(eigenval)])

## ------------------------------------------------------------------------
windows <- st_data$proj.pca$Xt.proj$windows[-15]
eigenv <- data.frame(windows, st_data$proj.pca$U)
ggplot(eigenv, aes(x = windows, y = eigenv[ , 2])) +
  geom_step(aes(colour = mycol[1])) +
  geom_step(aes(x = windows, y = eigenv[ , 3], colour = mycol[2])) +
  geom_step(aes(x = windows, y = eigenv[ , 4], colour = mycol[3])) +
  scale_x_continuous(name = " ") +
  scale_y_continuous(name =  " ") +
  scale_colour_discrete(labels=c("Eigenvector 1", "Eigenvector 2", "Eigenvector 3"),
                        name = " ")

## ------------------------------------------------------------------------
suppressPackageStartupMessages(require(fda))
Canada.temp <- CanadianWeather$monthlyTemp[ , 1:10]
matplot(Canada.temp, type = 'l', xaxt = "n", xlab = "", ylab = "Temp °C", col = mycol[1:10],
        lwd = 2)
axis(side = 1, labels = rownames(Canada.temp), at = 1:12)

## ------------------------------------------------------------------------
Canada.pca <- pca.Deville(t(Canada.temp), t = t(matrix(rep(1:12, 10), nrow = 12, ncol = 10)), 
                          t.range = c(1, 12), breaks = 13)
barplot(Canada.pca$perc.lambda, col = mycol[1:12])

## ------------------------------------------------------------------------
eigenv <- data.frame(windows = 1:(13-1), Canada.pca$U.histo) 

ggplot(eigenv, aes(x = windows, y = eigenv[ , 2])) +
  geom_step(aes(colour = mycol[1])) +
  geom_step(aes(x = windows, y = eigenv[ , 3], colour = mycol[2])) +
  geom_step(aes(x = windows, y = eigenv[ , 4], colour = mycol[3])) +
  scale_x_continuous(name = " ") +
  scale_y_continuous(name =  " ") +
  scale_colour_discrete(labels=c("Eigenvector 1", "Eigenvector 2", "Eigenvector 3"),
                        name = " ")

