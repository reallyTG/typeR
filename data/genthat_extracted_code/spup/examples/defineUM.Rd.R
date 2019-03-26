library(spup)


### Name: defineUM
### Title: Define an uncertainty model for a single variable
### Aliases: defineUM

### ** Examples


# define uncertainty model for spatial numerical variable
data(dem30m, dem30m_sd)
dem_crm <- makeCRM(acf0 = 0.78, range = 321, model = "Exp")
demUM <- defineUM(uncertain = TRUE, distribution = "norm",
                   distr_param = c(dem30m, dem30m_sd), crm = dem_crm)
class(demUM)
                   
# define uncertainty model for spatial categorical variable
data(woon)
woonUM <- defineUM(TRUE, categories = c(1,2,3), cat_prob = woon[, c(4:6)])
class(woonUM)

# define uncertainty model for a variable desribed by a scalar
scalarUM <- defineUM(uncertain = TRUE, distribution = "gamma", distr_param = c(1,2))
class(scalarUM)

# define uncertainty model for two spatial cross-correlated variables
data(OC, OC_sd, TN, TN_sd)

OC_crm <- makeCRM(acf0 = 0.6, range = 1000, model = "Sph")
OC_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(OC, OC_sd), crm = OC_crm, id = "OC")
class(OC_UM)

TN_crm <- makeCRM(acf0 = 0.4, range = 1000, model = "Sph")
TN_UM <- defineUM(TRUE, distribution = "norm", distr_param = c(TN, TN_sd), crm = TN_crm, id = "TN")
class(TN_UM)




