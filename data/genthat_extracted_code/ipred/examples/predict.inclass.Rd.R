library(ipred)


### Name: predict.inclass
### Title: Predictions from an Inclass Object
### Aliases: predict.inclass
### Keywords: misc

### ** Examples

## Not run: 
##D # Simulation model, classification rule following Hand et al. (2001)
##D 
##D theta90 <- varset(N = 1000, sigma = 0.1, theta = 90, threshold = 0)
##D 
##D dataset <- as.data.frame(cbind(theta90$explanatory, theta90$intermediate))
##D names(dataset) <- c(colnames(theta90$explanatory),
##D colnames(theta90$intermediate))
##D 
##D classify <- function(Y, threshold = 0) {
##D   Y <- Y[,c("y1", "y2")]
##D   z <- (Y > threshold)
##D   resp <- as.factor(ifelse((z[,1] + z[,2]) > 1, 1, 0))
##D   return(resp)
##D }
##D 
##D formula <- response~y1+y2~x1+x2
##D 
##D fit <- inclass(formula, data = dataset, pFUN = list(list(model = lm)), 
##D  cFUN = classify)
##D 
##D predict(object = fit, newdata = dataset)
##D 
##D 
##D data("Smoking", package = "ipred")
##D 
##D # explanatory variables are: TarY, NicY, COY, Sex, Age
##D # intermediate variables are: TVPS, BPNL, COHB
##D # reponse is defined by:
##D 
##D classify <- function(data){
##D   data <- data[,c("TVPS", "BPNL", "COHB")]
##D   res <- t(t(data) > c(4438, 232.5, 58))
##D   res <- as.factor(ifelse(apply(res, 1, sum) > 2, 1, 0))
##D   res
##D }
##D 
##D response <- classify(Smoking[ ,c("TVPS", "BPNL", "COHB")])
##D smoking <- cbind(Smoking, response)
##D 
##D formula <- response~TVPS+BPNL+COHB~TarY+NicY+COY+Sex+Age
##D 
##D fit <- inclass(formula, data = smoking, 
##D   pFUN = list(list(model = lm)), cFUN = classify)
##D 
##D 
##D predict(object = fit, newdata = smoking)
## End(Not run)

data("GlaucomaMVF", package = "ipred")
library("rpart")
glaucoma <- GlaucomaMVF[,(names(GlaucomaMVF) != "tension")]
# explanatory variables are derived by laser scanning image and intra occular pressure
# intermediate variables are: clv, cs, lora
# response is defined by

classify <- function (data) {
  attach(data) 
  res <- ifelse((!is.na(clv) & !is.na(lora) & clv >= 5.1 & lora >= 
        49.23372) | (!is.na(clv) & !is.na(lora) & !is.na(cs) & 
        clv < 5.1 & lora >= 58.55409 & cs < 1.405) | (is.na(clv) & 
        !is.na(lora) & !is.na(cs) & lora >= 58.55409 & cs < 1.405) | 
        (!is.na(clv) & is.na(lora) & cs < 1.405), 0, 1)
  detach(data)
  factor (res, labels = c("glaucoma", "normal"))
}

fit <- inclass(Class~clv+lora+cs~., data = glaucoma, 
             pFUN = list(list(model = rpart)), cFUN = classify)

data("GlaucomaM", package = "TH.data")
predict(object = fit, newdata = GlaucomaM)




