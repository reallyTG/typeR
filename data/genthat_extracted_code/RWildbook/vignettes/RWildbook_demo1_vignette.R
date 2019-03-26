## ---- eval=FALSE---------------------------------------------------------
#  data1 <- searchWB(username="username",
#                    password="password",
#                    baseURL ="whaleshark.org",
#                    object="Encounter",
#                    individualID=c("A-001"))

## ---- eval=FALSE---------------------------------------------------------
#  data2<- searchWB(username="username",
#                   password="password",
#                   baseURL ="whaleshark.org",
#                   jdoql="SELECT FROM org.ecocean.Encounter WHERE individualID == 'A-001'")

## ---- eval=FALSE---------------------------------------------------------
#  data3 <- searchWB(searchURL = "https://username:password@whaleshark.org/rest/jdoql?SELECT FROM org.ecocean.Encounter WHERE individualID == 'A-001'")

## ----eval=FALSE----------------------------------------------------------
#  data3 <-
#    searchWB(username = "username",
#             password = "password",
#             searchURL = "https://www.whaleshark.org/rest/jdoql?SELECT FROM org.ecocean.Encounter WHERE individualID == 'A-001'")

## ------------------------------------------------------------------------
data("vignette_1_data",package="RWildbook")
head(vignette_1_data)[,c("location","year","month","day")]

