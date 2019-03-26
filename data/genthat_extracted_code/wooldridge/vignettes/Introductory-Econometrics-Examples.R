## ---- echo = TRUE, eval = FALSE, warning=FALSE---------------------------
#  install.packages("wooldridge")

## ---- echo = TRUE, eval = TRUE, warning=FALSE, message=FALSE-------------
library(wooldridge)

## ---- echo=FALSE, eval=TRUE, warning=FALSE, message=FALSE----------------
library(stargazer)
library(knitr)

## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("wage1")
#  
#  ?wage1

## ---- echo=FALSE---------------------------------------------------------
plot(y = wage1$wage, x = wage1$educ, col = "darkgreen", pch = 21, bg = "lightgrey",     
     cex=1.25, xaxt="n", frame = FALSE, main = "Wages vs. Education, 1976", 
     xlab = "years of education", ylab = "Hourly wages")
axis(side = 1, at = c(0,6,12,18))
rug(wage1$wage, side=2, col="darkgreen")

## ------------------------------------------------------------------------
log_wage_model <- lm(lwage ~ educ, data = wage1)

## ---- echo = TRUE, eval = FALSE, warning=FALSE---------------------------
#  summary(log_wage_model)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html", log_wage_model, single.row = TRUE, header = FALSE, digits = 5)

## ---- echo=FALSE---------------------------------------------------------
plot(y = wage1$lwage, x = wage1$educ, main = "A Log Wage Equation", 
     col = "darkgreen", pch = 21, bg = "lightgrey", cex=1.25,
     xlab = "years of education", ylab = "log of average hourly wages",
     xaxt="n", frame = FALSE)
axis(side = 1, at = c(0,6,12,18))
abline(log_wage_model, col = "blue", lwd=2)
rug(wage1$lwage, side=2, col="darkgreen")

## ---- eval=FALSE---------------------------------------------------------
#  ?wage1

## ---- fig.height=3, echo=FALSE-------------------------------------------
par(mfrow=c(1,3))

plot(y = wage1$lwage, x = wage1$educ, col="darkgreen", xaxt="n", frame = FALSE, main = "years of education", xlab = "", ylab = "")
mtext(side=2, line=2.5, "Hourly wages", cex=1.25)
axis(side = 1, at = c(0,6,12,18))
abline(lm(lwage ~ educ, data=wage1), col = "darkblue", lwd=2)

plot(y = wage1$lwage, x = wage1$exper, col="darkgreen", xaxt="n", frame = FALSE, main = "years of experience", xlab = "", ylab = "")
axis(side = 1, at = c(0,12.5,25,37.5,50))
abline(lm(lwage ~ exper, data=wage1), col = "darkblue", lwd=2)

plot(y = wage1$lwage, x = wage1$tenure, col="darkgreen", xaxt="n", frame = FALSE, main = "years with employer", xlab = "", ylab = "")
axis(side = 1, at = c(0,11,22,33,44))
abline(lm(lwage ~ tenure, data=wage1), col = "darkblue", lwd=2)

## ------------------------------------------------------------------------
hourly_wage_model <- lm(lwage ~ educ + exper + tenure, data = wage1)

## ---- eval=FALSE---------------------------------------------------------
#  coefficients(hourly_wage_model)

## ---- echo=FALSE---------------------------------------------------------
kable(coefficients(hourly_wage_model), digits=4, col.names = "Coefficients", align = 'l')

## ---- echo=FALSE---------------------------------------------------------
barplot(sort(100*hourly_wage_model$coefficients[-1]), horiz=TRUE, las=1,
        ylab = " ", main = "Coefficients of Hourly Wage Equation")

## ---- eval=FALSE---------------------------------------------------------
#  summary(hourly_wage_model)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html", hourly_wage_model,  single.row = TRUE, header = FALSE, digits=5)

## ---- eval=FALSE---------------------------------------------------------
#  summary(hourly_wage_model)$coefficients

## ---- echo=FALSE---------------------------------------------------------
kable(summary(hourly_wage_model)$coefficients, align="l", digits=5)

## ---- fig.height=8, eval=FALSE, echo=FALSE-------------------------------
#  par(mfrow=c(2,2))
#  
#  plot(y = hourly_wage_model$residuals, x = hourly_wage_model$fitted.values , col="darkgreen", xaxt="n",
#       frame = FALSE, main = "Fitted Values", xlab = "", ylab = "")
#  mtext(side=2, line=2.5, "Model Residuals", cex=1.25)
#  abline(0, 0, col = "darkblue", lty=2, lwd=2)
#  
#  plot(y = hourly_wage_model$residuals, x = wage1$educ, col="darkgreen", xaxt="n",
#       frame = FALSE, main = "years of education", xlab = "", ylab = "")
#  axis(side = 1, at = c(0,6,12,18))
#  abline(0, 0, col = "darkblue", lty=2, lwd=2)
#  
#  plot(y = hourly_wage_model$residuals, x = wage1$exper, col="darkgreen", xaxt="n",
#       frame = FALSE, main = "years of experience", xlab = "", ylab = "")
#  mtext(side=2, line=2.5, "Model Residuals", cex=1.25)
#  axis(side = 1, at = c(0,12.5,25,37.5,50))
#  abline(0, 0, col = "darkblue", lty=2, lwd=2)
#  
#  plot(y = hourly_wage_model$residuals, x = wage1$tenure, col="darkgreen", xaxt="n",
#       frame = FALSE, main = "years with employer", xlab = "", ylab = "")
#  axis(side = 1, at = c(0,11,22,33,44))
#  abline(0, 0, col = "darkblue", lty=2, lwd=2)

## ---- echo=FALSE---------------------------------------------------------
barplot(sort(summary(hourly_wage_model)$coefficients[-1, "t value"]), horiz=TRUE, las=1, 
        ylab = " ", main = "t statistics of Hourly Wage Equation")

## ---- echo = TRUE, eval = TRUE, warning=FALSE, message=FALSE-------------
data("jtrain")

## ---- echo = TRUE, eval = FALSE, warning=FALSE---------------------------
#  ?jtrain

## ------------------------------------------------------------------------
jtrain_subset <- subset(jtrain, subset = (year == 1987 & union == 0),
                          select = c(year, union, lscrap, hrsemp, lsales, lemploy))

## ------------------------------------------------------------------------
sum(is.na(jtrain_subset))

## ------------------------------------------------------------------------
jtrain_clean <- na.omit(jtrain_subset)

## ---- echo=FALSE, fig.height=3-------------------------------------------
par(mfrow=c(1,3))

point_size <- 1.75

plot(y = jtrain_clean$lscrap, x = jtrain_clean$hrsemp, frame = FALSE, 
main = "Total (hours/employees) trained", ylab = "", xlab="", pch = 21, bg = "lightgrey", cex=point_size)
mtext(side=2, line=2, "Log(scrap rate)", cex=1.25)
abline(lm(lscrap ~ hrsemp, data=jtrain_clean), col = "blue", lwd=2)

plot(y = jtrain_clean$lscrap, x = jtrain_clean$lsales, frame = FALSE, main = "Log(annual sales $)", ylab = " ", xlab="", pch = 21, bg = "lightgrey", cex=point_size)
abline(lm(lscrap ~ lsales, data=jtrain_clean), col = "blue", lwd=2)

plot(y = jtrain_clean$lscrap, x = jtrain_clean$lemploy, frame = FALSE, main = "Log(# employees at plant)", ylab = " ", xlab="", pch = 21, bg = "lightgrey", cex=point_size)
abline(lm(lscrap ~ lemploy, data=jtrain_clean), col = "blue", lwd=2)

## ------------------------------------------------------------------------
linear_model <- lm(lscrap ~ hrsemp + lsales + lemploy, data = jtrain_clean)

## ---- eval=FALSE, warning=FALSE, message=FALSE---------------------------
#  summary(linear_model)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html", linear_model, single.row = TRUE, header = FALSE, digits=5)

## ---- echo=FALSE, eval=FALSE---------------------------------------------
#  #Plot the coefficients, representing the impact of each variable on $log($`scrap`$)$ for a quick comparison. As you can observe, for some variables, the confidence intervals are wider than others.
#  coefficient <- coef(linear_model)[-1]
#   confidence <- confint(linear_model, level = 0.95)[-1,]
#  
#  graph <- drop(barplot(coefficient, ylim = range(c(confidence)),
#                main = "Coefficients & 95% C.I. of variables on Firm Scrap Rates"))
#  
#  arrows(graph, coefficient, graph, confidence[,1], angle=90, length=0.55, col="blue", lwd=2)
#  arrows(graph, coefficient, graph, confidence[,2], angle=90, length=0.55, col="blue", lwd=2)
#  

## ------------------------------------------------------------------------
data("hprice3")

## ---- echo=FALSE, fig.align='center'-------------------------------------
par(mfrow=c(1,2))

plot(y = hprice3$price, x = hprice3$dist, main = " ", xlab = "Distance to Incinerator in feet", ylab = "Selling Price",  frame = FALSE, pch = 21, bg = "lightgrey")
abline(lm(price ~ dist, data=hprice3), col = "blue", lwd=2)

## ------------------------------------------------------------------------
price_dist_model <- lm(lprice ~ ldist, data = hprice3)

## ------------------------------------------------------------------------
price_area_model <- lm(lprice ~ ldist + larea, data = hprice3)

## ---- eval=FALSE---------------------------------------------------------
#  summary(price_dist_model)
#  summary(price_area_model)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",price_dist_model, price_area_model,  single.row = TRUE, header = FALSE, digits=5)

## ---- echo=FALSE---------------------------------------------------------
par(mfrow=c(1,2))

point_size <- 0.80

plot(y = hprice3$lprice, x = hprice3$ldist, frame = FALSE, 
main = "Log(distance from incinerator)", ylab = "", xlab="", 
pch = 21, bg = "lightgrey", cex=point_size)
mtext(side=2, line=2, "Log( selling price )", cex=1.25)
abline(lm(lprice ~ ldist, data=hprice3), col = "blue", lwd=2)

plot(y = hprice3$lprice, x = hprice3$larea, frame = FALSE, main = "Log(square footage of house)", ylab = " ", xlab="", pch = 21, bg = "lightgrey", cex=point_size)
abline(lm(lprice ~ larea, data=hprice3), col = "blue", lwd=2)


## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("hprice2")
#  ?hprice2

## ---- tidy = TRUE--------------------------------------------------------
housing_level <- lm(price ~ nox + crime + rooms + dist + stratio, data = hprice2)

## ------------------------------------------------------------------------
housing_standardized <- lm(scale(price) ~ 0 + scale(nox) + scale(crime) + scale(rooms) + scale(dist) + scale(stratio), data = hprice2)

## ---- eval=FALSE---------------------------------------------------------
#  summary(housing_level)
#  summary(housing_standardized)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",housing_level, housing_standardized,  single.row = TRUE, header = FALSE, digits=5)

## ------------------------------------------------------------------------
housing_model_4.5 <- lm(lprice ~ lnox + log(dist) + rooms + stratio, data = hprice2)

housing_model_6.2 <- lm(lprice ~ lnox + log(dist) + rooms + I(rooms^2) + stratio, 
                        data = hprice2)

## ---- eval=FALSE---------------------------------------------------------
#  summary(housing_model_4.5)
#  summary(housing_model_6.2)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html", housing_model_4.5 , housing_model_6.2, single.row = TRUE, header = FALSE, digits=5)

## ------------------------------------------------------------------------
beta_1 <- summary(housing_model_6.2)$coefficients["rooms",1] 
beta_2 <- summary(housing_model_6.2)$coefficients["I(rooms^2)",1]
turning_point <- abs(beta_1 / (2*beta_2))

print(turning_point)

## ------------------------------------------------------------------------
Rooms <- c(min(hprice2$rooms), 4, turning_point, 5, 5.5, 6.45, 7.5, max(hprice2$rooms))
Percent.Change <- 100*(beta_1 + 2*beta_2*Rooms)

kable(data.frame(Rooms, Percent.Change))

## ---- echo=FALSE---------------------------------------------------------
from <- min(hprice2$rooms)
to <- max(hprice2$rooms)
rooms <- seq(from=from, to =to, by = ((to - from)/(NROW(hprice2)-1)))
quadratic <- abs(100*summary(housing_model_6.2)$coefficients["rooms",1] + 200*summary(housing_model_6.2)$coefficients["I(rooms^2)",1]*rooms)

housing_model_frame <- model.frame(housing_model_6.2)

housing_sq <- abs(beta_1*housing_model_frame[,"rooms"]) + 
              beta_2*housing_model_frame[,"I(rooms^2)"]

#plot(y=hprice2$lprice, x=housing_sq)

## ---- echo=FALSE---------------------------------------------------------
rooms_interaction <- lm(lprice ~ rooms + I(rooms^2), data = hprice2)

par(mfrow=c(1,2))

plot(y = hprice2$lprice, x = hprice2$rooms, xaxt="n", pch = 21, bg = "lightgrey",
     frame = FALSE, main = "lprice ~ rooms", xlab = "Rooms", ylab = "")
mtext(side=2, line=2, "Log( selling price )", cex=1.25)
axis(side = 1, at = c(min(hprice2$rooms), 4, 5, 6, 7, 8, max(hprice2$rooms)))
abline(lm(lprice ~ rooms, data = hprice2), col="red", lwd=2.5)

plot(y = hprice2$lprice, x = hprice2$rooms, xaxt="n", pch = 21, bg = "lightgrey",
     frame = FALSE, main = "lprice ~ rooms + I(rooms^2)", xlab = "Rooms", ylab = " ")
axis(side = 1, at = c(min(hprice2$rooms), 4, 5, 6, 7, 8, max(hprice2$rooms)))
lines(sort(hprice2$rooms), sort(fitted(rooms_interaction)), col = "red", lwd=2.5)


## ------------------------------------------------------------------------
data("hprice1")

## ---- eval=FALSE---------------------------------------------------------
#  ?hprice1

## ---- fig.height=8, eval=FALSE, echo=FALSE-------------------------------
#  par(mfrow=c(2,2))
#  
#  palette(rainbow(6, alpha = 0.8))
#  plot(y = hprice1$lprice, x = hprice1$llotsize, col=hprice1$bdrms, pch = 19,
#       frame = FALSE, main = "Log(lot size)", xlab = "", ylab = "")
#  mtext(side=2, line=2, "Log( selling price )", cex=1.25)
#  
#  
#  plot(y = hprice1$lprice, x = hprice1$lsqrft, col=hprice1$bdrms, pch=19,
#       frame = FALSE, main = "Log(home size)", xlab = "Rooms", ylab = " ")
#  legend(8, 5.8, sort(unique(hprice1$bdrms)), col = 1:length(hprice1$bdrms),
#         pch=19, title = "bdrms")
#  
#  
#  hprice1$colonial <- as.factor(hprice1$colonial)
#  
#  palette(rainbow(2, alpha = 0.8))
#  plot(y = hprice1$lprice, x = hprice1$llotsize, col=hprice1$colonial, pch = 19, bg = "lightgrey",
#       frame = FALSE, main = "Log(lot size)", xlab = "", ylab = "")
#  mtext(side=2, line=2, "Log( selling price )", cex=1.25)
#  
#  
#  plot(y = hprice1$lprice, x = hprice1$lsqrft, col=hprice1$colonial, pch=19,
#       frame = FALSE, main = "Log(home size)", xlab = "Rooms", ylab = " ")
#  legend(8, 5.25, unique(hprice1$colonial), col=1:length(hprice1$colonial), pch=19, title = "colonial")

## ------------------------------------------------------------------------
housing_qualitative <- lm(lprice ~ llotsize + lsqrft + bdrms + colonial, data = hprice1)

## ---- eval=FALSE---------------------------------------------------------
#  summary(housing_qualitative)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",housing_qualitative,  single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE------------------------------------------------------
data("gpa1")

gpa1$parcoll <- as.integer(gpa1$fathcoll==1 | gpa1$mothcoll)


GPA_OLS <- lm(PC ~ hsGPA + ACT + parcoll, data = gpa1)

## ------------------------------------------------------------------------
weights <- GPA_OLS$fitted.values * (1-GPA_OLS$fitted.values)

GPA_WLS <- lm(PC ~ hsGPA + ACT + parcoll, data = gpa1, weights = 1/weights)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",GPA_OLS, GPA_WLS,  single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE------------------------------------------------------
data("rdchem")

all_rdchem <- lm(rdintens ~ sales + profmarg, data = rdchem)

## ---- echo=FALSE---------------------------------------------------------
plot_title <- "FIGURE 9.1: Scatterplot of R&D intensity against firm sales"
x_axis <- "firm sales (in millions of dollars)"
y_axis <- "R&D as a percentage of sales"

plot(rdintens ~ sales, pch = 21, bg = "lightgrey", data = rdchem, main = plot_title, xlab = x_axis, ylab = y_axis)

## ------------------------------------------------------------------------
smallest_rdchem <- lm(rdintens ~ sales + profmarg, data = rdchem, 
                      subset = (sales < max(sales)))

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",all_rdchem, smallest_rdchem,  single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE------------------------------------------------------
data("intdef")

tbill_model <- lm(i3 ~ inf + def, data = intdef)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",tbill_model, single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE------------------------------------------------------
data("barium")
barium_imports <- lm(lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + afdec6, data = barium)

## ------------------------------------------------------------------------
barium_seasonal <- lm(lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + afdec6 + feb + mar + apr + may + jun + jul + aug + sep + oct + nov + dec, data = barium)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",barium_imports, barium_seasonal,  single.row = TRUE, header = FALSE, digits=5)

## ------------------------------------------------------------------------
barium_anova <- anova(barium_imports, barium_seasonal)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",barium_anova,  single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE------------------------------------------------------
data("earns")

wage_time <- lm(lhrwage ~ loutphr + t, data = earns)

## ------------------------------------------------------------------------
wage_diff <- lm(diff(lhrwage) ~ diff(loutphr), data = earns)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",wage_time, wage_diff,  single.row = TRUE, header = FALSE, digits=5)

## ------------------------------------------------------------------------
data("barium")

barium_model <- lm(lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + afdec6, 
                   data = barium)

## ------------------------------------------------------------------------
library(prais)
barium_prais_winsten <- prais_winsten(lchnimp ~ lchempi + lgas + lrtwex + befile6 + affile6 + afdec6, data = barium)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html", barium_model, single.row = TRUE, header = FALSE, digits=5)

## ------------------------------------------------------------------------
barium_prais_winsten

## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("nyse")
#  ?nyse

## ------------------------------------------------------------------------
return_AR1 <-lm(return ~ return_1, data = nyse)

## ------------------------------------------------------------------------
return_mu <- residuals(return_AR1)
mu2_hat_model <- lm(return_mu^2 ~ return_1, data = return_AR1$model)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",return_AR1, mu2_hat_model,  single.row = TRUE, header = FALSE, digits=5)

## ------------------------------------------------------------------------
mu2_hat  <- return_mu[-1]^2
mu2_hat_1 <- return_mu[-NROW(return_mu)]^2
arch_model <- lm(mu2_hat ~ mu2_hat_1)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",arch_model, single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("traffic1")
#  ?traffic1

## ------------------------------------------------------------------------
DD_model <- lm(cdthrte ~ copen + cadmn, data = traffic1)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",DD_model,  single.row = TRUE, header = FALSE, digits=5)

## ---- warning=FALSE, message=FALSE---------------------------------------
library(plm)
data("jtrain")
scrap_panel <- plm(lscrap ~ d88 + d89 + grant + grant_1, data = jtrain,
            index = c('fcode','year'), model = 'within', effect ='individual')

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",scrap_panel,  single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("mroz")
#  ?mroz

## ------------------------------------------------------------------------
wage_educ_model <- lm(lwage ~ educ, data = mroz)

## ------------------------------------------------------------------------
fatheduc_model <- lm(educ ~ fatheduc, data = mroz, subset = (inlf==1))

## ---- message=FALSE------------------------------------------------------
library("AER")
wage_educ_IV <- ivreg(lwage ~ educ | fatheduc, data = mroz)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",wage_educ_model, fatheduc_model, wage_educ_IV, single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("wage2")
#  ?wage2

## ------------------------------------------------------------------------
educ_sibs_model <- lm(educ ~ sibs, data = wage2)

## ---- message=FALSE------------------------------------------------------
library("AER")
educ_sibs_IV <- ivreg(lwage ~ educ | sibs, data = wage2)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",educ_sibs_model, educ_sibs_IV, wage_educ_IV,  single.row = TRUE, header = FALSE, digits=5)

## ------------------------------------------------------------------------
data("mroz")
wage_educ_exper_IV <- ivreg(lwage ~ educ + exper + expersq | exper + expersq + motheduc + fatheduc, data = mroz)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE, echo=FALSE----
stargazer(type = "html",wage_educ_exper_IV,  single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("openness")
#  ?openness

## ------------------------------------------------------------------------
open_model <-lm(open ~ lpcinc + lland, data = openness)

## ------------------------------------------------------------------------
library(AER)
inflation_IV <- ivreg(inf ~ open + lpcinc | lpcinc + lland, data = openness)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",open_model, inflation_IV,  single.row = TRUE, header = FALSE, digits=5)

## ---- message=FALSE, eval=FALSE------------------------------------------
#  data("phillips")
#  ?phillips

## ------------------------------------------------------------------------
phillips_train <- subset(phillips, year <= 1996)

unem_AR1 <- lm(unem ~ unem_1, data = phillips_train)

## ------------------------------------------------------------------------
unem_inf_VAR1 <- lm(unem ~ unem_1 + inf_1, data = phillips_train)

## ---- results='asis', echo=FALSE, warning=FALSE, message=FALSE-----------
stargazer(type = "html",unem_AR1, unem_inf_VAR1,  single.row = TRUE, header = FALSE, digits=5)

## ---- warning=FALSE, message=FALSE, echo=TRUE----------------------------
phillips_test <- subset(phillips, year >= 1997)

AR1_forecast <- predict.lm(unem_AR1, newdata = phillips_test)
VAR1_forecast <- predict.lm(unem_inf_VAR1, newdata = phillips_test)

kable(cbind(phillips_test[ ,c("year", "unem")], AR1_forecast, VAR1_forecast))

