library(sparkwarc)


### Name: spark_read_warc
### Title: Reads a WARC File into Apache Spark
### Aliases: spark_read_warc

### ** Examples


library(sparklyr)
sc <- spark_connect(master = "spark://HOST:PORT")
df <- spark_read_warc(
  sc,
  system.file("samples/sample.warc", package = "sparkwarc"),
  repartition = FALSE,
  memory = FALSE,
  overwrite = FALSE
)

spark_disconnect(sc)




