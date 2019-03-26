library(aurelius)


### Name: avro_fullname
### Title: avro_fullname
### Aliases: avro_fullname

### ** Examples

avro_fullname(avro_record(list(), "MyRecord"))                   # "MyRecord"
avro_fullname(avro_record(list(), "MyRecord", "com.wowzers"))    # "com.wowzers.MyRecord"



