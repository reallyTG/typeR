## ----epileptic_data------------------------------------------------------
library(joineR)
data(epileptic)
head(epileptic)

## ----interaction_data----------------------------------------------------
epileptic$interaction <- with(epileptic, time * (treat == "LTG"))

## ----jointdata, fig.width=7, fig.height=4--------------------------------
longitudinal <- epileptic[, c(1:3, 13)]
survival <- UniqueVariables(epileptic, c(4, 6), "id")
baseline <- UniqueVariables(epileptic, "treat", "id")
data <- jointdata(longitudinal = longitudinal, 
                  survival = survival,
                  baseline = baseline,
                  id.col = "id", time.col = "time")

summary(data)
jointplot(data, Y.col = "dose", Cens.col = "with.status2")

