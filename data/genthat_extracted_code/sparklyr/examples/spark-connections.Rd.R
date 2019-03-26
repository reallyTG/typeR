library(sparklyr)


### Name: spark-connections
### Title: Manage Spark Connections
### Aliases: spark-connections spark_connect spark_connection_is_open
###   spark_disconnect spark_disconnect_all spark_submit

### ** Examples


sc <- spark_connect(master = "spark://HOST:PORT")
connection_is_open(sc)

spark_disconnect(sc)




