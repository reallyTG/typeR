library(aurelius)


### Name: avro_typemap
### Title: avro_typemap
### Aliases: avro_typemap

### ** Examples

tm <- avro_typemap(
    MyType1 = avro_record(list(one = avro_int, two = avro_double, three = avro_string)),
    MyType2 = avro_array(avro_double)
)
tm("MyType1")           # produces the whole declaration
tm("MyType1")           # produces just "MyType1"
tm("MyType2")           # produces the whole declaration
tm("MyType2")           # produces the declaration again because this is not a named type



