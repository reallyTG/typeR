library(sparklyr)


### Name: invoke
### Title: Invoke a Method on a JVM Object
### Aliases: invoke invoke_static invoke_new

### ** Examples


sc <- spark_connect(master = "spark://HOST:PORT")
spark_context(sc) %>%
  invoke("textFile", "file.csv", 1L) %>%
    invoke("count")




