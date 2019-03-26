## ----setup, include=FALSE------------------------------------------------
knitr::opts_chunk$set(echo = TRUE)

## ------------------------------------------------------------------------
library(RRPP)
data("PupfishHeads")
PupfishHeads$logHeadSize <- log(PupfishHeads$headSize)
fit <- lm.rrpp(logHeadSize ~ sex + locality/year, 
               SS.type = "I", data = PupfishHeads, 
               print.progress = FALSE)
summary(fit)
anova(fit, effect.type = "F") 

## ------------------------------------------------------------------------
anova(fit, effect.type = "F", 
  error = c("Residuals", "locality:year", "Residuals"))

## ------------------------------------------------------------------------
fit.sex <- lm.rrpp(logHeadSize ~ sex, 
                   data = PupfishHeads, 
                   print.progress = FALSE)
fit.sex.loc<- lm.rrpp(logHeadSize ~ sex + locality, 
                      data = PupfishHeads, 
                      print.progress = FALSE)
fit.sex.loc.year<- lm.rrpp(logHeadSize ~ sex + locality/year, 
                           data = PupfishHeads, 
                           print.progress = FALSE)
anova(fit.sex, fit.sex.loc, fit.sex.loc.year, print.progress= FALSE)

## ------------------------------------------------------------------------
coef(fit, test = TRUE)

## ---- fig.height=3, fig.width=5------------------------------------------
sizeDF <- data.frame(sex = c("Female", "Male"))
rownames(sizeDF) <- c("Female", "Male")
sizePreds <- predict(fit, sizeDF)
plot(sizePreds)


## ---- fig.height=3, fig.width=5------------------------------------------
plot(sizePreds, pch = 21, cex = 3, bg = c(2,4), lwd = 2)


## ------------------------------------------------------------------------
fit2 <- lm.rrpp(logHeadSize ~ sex + locality/year, 
                SS.type = "II", data = PupfishHeads, print.progress = FALSE)
fit3 <- lm.rrpp(logHeadSize ~ sex + locality/year, 
                SS.type = "III", data = PupfishHeads, print.progress = FALSE)

anova(fit)
anova(fit2)
anova(fit3)


## ------------------------------------------------------------------------
data(Pupfish)
Pupfish$logSize <- log(Pupfish$CS) 
fit <- lm.rrpp(coords ~ logSize + Sex*Pop, SS.type = "I", 
               data = Pupfish, print.progress = FALSE) 
summary(fit, formula = FALSE)
anova(fit) 
coef(fit, test = TRUE) 


## ---- error = TRUE-------------------------------------------------------
fit$LM$data$coords <- Pupfish$coords
fit.par <- lm(fit$call$f1, data = fit$LM$data)
identical(fit$LM$coefficients, fit.par$coefficients)
summary(manova(fit.par))

## ---- fig.height=5, fig.width=6------------------------------------------
shapeDF <- expand.grid(Sex = levels(Pupfish$Sex), Pop = levels(Pupfish$Pop))
rownames(shapeDF) <- paste(shapeDF$Sex, shapeDF$Pop, sep = ".")
shapePreds <- predict(fit, shapeDF, confidence = 0.95)
plot(shapePreds, PC = TRUE, ellipse = TRUE) # generic 
plot(shapePreds, PC = TRUE, ellipse = TRUE, 
     pch = 19, col = 1:NROW(shapeDF)) # with added par arguments

groups <- interaction(Pupfish$Sex, Pupfish$Pop)
plot(fit, type = "PC") # generic
plot(fit, type = "PC", pch = 19, col = groups) # with added par arguments


## ---- fig.height=5, fig.width=6------------------------------------------
plot(fit, type = "regression", reg.type = "PredLine", 
    predictor = Pupfish$logSize, pch=19,
    col = as.numeric(groups))

## ------------------------------------------------------------------------
PWT <- pairwise(fit, groups = interaction(Pupfish$Sex, Pupfish$Pop))
summary(PWT, confidence = 0.95)


## ------------------------------------------------------------------------
fit2 <- lm.rrpp(coords ~ logSize * Sex * Pop, SS.type = "I", 
                data = Pupfish, print.progress = FALSE, iter = 999) 
summary(fit2, formula = FALSE)
anova(fit, fit2, print.progress = FALSE)

PW2 <- pairwise(fit2, fit.null = fit, groups = groups, 
                covariate = Pupfish$logSize, print.progress = FALSE) 
PW2
summary(PW2, confidence = 0.95, 
        test.type = "dist") # distances between slope vector lengths
summary(PW2, confidence = 0.95, 
        test.type = "dist", stat.table = FALSE)
summary(PW2, confidence = 0.95, 
        test.type = "VC",
        angle.type = "deg") # correlation between slope vectors (and angles)


## ------------------------------------------------------------------------
D <- dist(Pupfish$coords) # inter-observation Euclidean distances
Pupfish$D <- D

fitD <- lm.rrpp(D ~ logSize + Sex*Pop, SS.type = "I", 
                data = Pupfish, print.progress = FALSE) 

summary(fitD)
summary(fit)

anova(fitD)
anova(fit)

## ------------------------------------------------------------------------
data(PlethMorph)
fitOLS <- lm.rrpp(TailLength ~ SVL, 
                  data = PlethMorph,
                  print.progress = FALSE)
fitGLS <- lm.rrpp(TailLength ~ SVL, 
                  data = PlethMorph, 
                  Cov = PlethMorph$PhyCov,
                  print.progress = FALSE)

anova(fitOLS)
anova(fitGLS)

coef(fitOLS, test = TRUE)
coef(fitGLS, test = TRUE)


## ---- fig.height=4, fig.width=8------------------------------------------
Y <- as.matrix(cbind(PlethMorph$TailLength,
PlethMorph$HeadLength,
PlethMorph$TailLength,
PlethMorph$Snout.eye,
PlethMorph$BodyWidth,
PlethMorph$Forelimb,
PlethMorph$Hindlimb))
PlethMorph <- rrpp.data.frame(PlethMorph, Y=Y)

fitOLSm <- lm.rrpp(Y ~ SVL, data = PlethMorph,
                   print.progress = FALSE)
fitGLSm <- lm.rrpp(Y ~ SVL, data = PlethMorph, 
                   Cov = PlethMorph$PhyCov,
                   print.progress = FALSE)

anova(fitOLSm)
anova(fitGLSm)

sizeDF <- data.frame(SVL = sort(PlethMorph$SVL))

plot(predict(fitOLSm, sizeDF), PC= TRUE) # Correlated error
plot(predict(fitGLSm, sizeDF), PC= TRUE) # Independent error


## ------------------------------------------------------------------------
attributes(fit)


