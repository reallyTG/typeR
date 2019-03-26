library(colr)


### Name: csub
### Title: a function to change column names
### Aliases: csub

### ** Examples

head(csub(iris, "\\.", "-")) # will change all dots in column names in "-"
head(csub(iris, "[pP]etal", "Beetle"))

# a more complex example showing the power of 'regex'

head(csub(data.frame(WorldPhones),"^([NM](?:\\w{2})?\\.)Amer", "\\1America"))


# this example will also work on other types (the call data.frame is not necessary)




