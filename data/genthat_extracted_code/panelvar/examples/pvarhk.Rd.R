library(panelvar)


### Name: pvarhk
### Title: Hank Kuehrsteiner Estimator for PVAR Model
### Aliases: pvarhk

### ** Examples

data(Dahlberg)
ex1_hk <-
pvarhk(dependent_vars = c("expenditures", "revenues", "grants"),
        lags = 1,
        transformation = "demean",
        data = Dahlberg,
        panel_identifier= c("id", "year"))



