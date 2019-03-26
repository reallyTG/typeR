library(sars)


### Name: gdm
### Title: Fit the General Dynamic Model of Island Biogeography
### Aliases: gdm

### ** Examples

#create an example dataset and fit the GDM using the exponential SAR model
data(galap)
galap$t <- rgamma(16, 5, scale = 2)
g <- gdm(galap, model = "expo", mod_sel = FALSE)

#Compare the GDM (using the exponential model) with other nested candidate models
g2 <- gdm(galap, model = "expo", mod_sel = TRUE)

#compare the GDM fitted using the linear, exponential and power SAR models
g3 <- gdm(galap, model = "all", mod_sel = FALSE)



