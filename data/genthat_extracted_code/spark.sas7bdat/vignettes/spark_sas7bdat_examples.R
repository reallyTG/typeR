## ---- eval=FALSE---------------------------------------------------------
#  library(sparklyr)
#  library(spark.sas7bdat)
#  mysasfile <- system.file("extdata", "iris.sas7bdat", package = "spark.sas7bdat")
#  
#  sc <- spark_connect(master = "local")
#  x <- spark_read_sas(sc, path = mysasfile, table = "sas_example")

## ---- eval=FALSE---------------------------------------------------------
#  library(dplyr)
#  library(magrittr)
#  x %>% group_by(Species) %>%
#    summarise(count = n(), length = mean(Sepal_Length), width = mean(Sepal_Width))

