library(properties)


### Name: write.properties
### Title: Write a Java Properties File
### Aliases: write.properties

### ** Examples

tf <- tempfile()
write.properties(file = tf,
    properties = list(key1 = "value1", key2 = "value2", key3 = "value3"),
    fields = c("key2", "key3"))
unlink(tf)



