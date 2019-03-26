## ---- echo = FALSE, message = FALSE--------------------------------------
library(sizeMat)

## ---- eval=FALSE---------------------------------------------------------
#  install.packages("sizeMat")

## ----echo=TRUE-----------------------------------------------------------
data(crabdata)

head(crabdata)

names(crabdata)

## ---- echo = TRUE--------------------------------------------------------
#For all the individuals
classify_data = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"), 
varSex = "sex_category", selectSex = NULL, method = "ld")

#For males only
classify_data_males = classify_mature(crabdata, varNames = c("carapace_width", "chela_heigth"), 
varSex = "sex_category", selectSex = "m", method = "ld")

## ---- echo = TRUE--------------------------------------------------------
print(classify_data)

## ---- echo = TRUE, fig.width = 10, fig.height = 10, results='hide', warning=FALSE----
par(mfrow = c(2,2))
plot(classify_data)

plot(classify_data, xlab = "Carapace width (mm.)", ylab = "Chela heigth (mm)", legendPlot = FALSE)
legend("topleft", "Put your legend here", bty = "n")

plot(classify_data, xlab = "Carapace width (mm.)", ylab = "Chela heigth (mm)", 
     col = c(2, 3), pch = c(5, 6), legendPlot = TRUE)

plot(classify_data, xlab = "Carapace width (mm.)", ylab = "Chela heigth (mm)", 
     col = c(2, 3), pch = c(5, 6), lty_lines = c(1, 2), lwd_lines = c(1, 3), 
     cex = c(1, 3), main = "Classification")

## ----echo = TRUE---------------------------------------------------------
#Frequentist regression 
my_ogive_fq = morph_mature(classify_data, method = "fq", niter = 1000)

print(my_ogive_fq)


#Bayesian regression
my_ogive_bayes = morph_mature(classify_data, method = "bayes", niter = 1000)

print(my_ogive_bayes)

## ----echo = TRUE, fig.width = 10, fig.height = 10, warning=FALSE---------
par(mfrow = c(2,2))
plot(my_ogive_fq, xlab = "Carapace width (mm.)", ylab = "Proportion mature", col = c("blue", "red"))

par(mfrow = c(2,2))
plot(my_ogive_bayes, xlab = "Carapace width (mm.)", ylab = "Proportion mature", col = c("blue", "red"))

## ----echo = TRUE, fig.width = 10, fig.height = 10, warning=FALSE---------
plot(my_ogive_fq, xlab = "Carapace width (mm.)", ylab = "Proportion mature", col = c("blue", "red"), onlyOgive = TRUE)

## ----echo=TRUE-----------------------------------------------------------
data(matFish)

head(matFish)

## ---- echo=TRUE----------------------------------------------------------
#Frequentist regression 
my_ogive_fq = gonad_mature(matFish, varNames = c("total_length", "stage_mat"), inmName = "I",
                           matName = c("II", "III", "IV" ), method = "fq", niter = 999)

print(my_ogive_fq)


#Bayesian regression 
my_ogive_bayes = gonad_mature(matFish, varNames = c("total_length", "stage_mat"), inmName = "I", 
                              matName = c("II", "III", "IV" ), method = "bayes", niter = 999)

print(my_ogive_bayes)

## ----echo = TRUE, fig.width = 10, fig.height = 10, warning=FALSE---------
par(mfrow = c(2,2))
plot(my_ogive_fq, xlab = "Total length (cm.)", ylab = "Proportion mature", col = c("blue", "red"))

par(mfrow = c(2,2))
plot(my_ogive_bayes, xlab = "Total length (cm.)", ylab = "Proportion mature", col = c("blue", "red"))

## ----echo = TRUE, fig.width = 10, fig.height = 10, warning=FALSE---------
par(mfrow = c(2,2))
plot(my_ogive_fq, xlab = "Total length (cm.)", ylab = "Proportion mature", col = c("blue", "red"), onlyOgive = TRUE)

