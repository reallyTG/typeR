library(tableschema.r)


### Name: types.castString
### Title: Cast string
### Aliases: types.castString

### ** Examples


# cast any string
types.castString(format = "default", value = "string")

# cast email
types.castString(format = "email", value = "name@gmail.com")
## Don't show: 
# cast uri
types.castString(format = "uri", value = "http://google.com")
## End(Don't show)
# cast binary
types.castString(format = "binary", value = "dGVzdA==")

# cast uuid
types.castString(format = "uuid", value = "95ecc380-afe9-11e4-9b6c-751b66dd541e")




