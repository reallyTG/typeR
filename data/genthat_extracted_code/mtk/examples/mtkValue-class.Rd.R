library(mtk)


### Name: mtkValue-class
### Title: The 'mtkValue' class
### Aliases: mtkValue-class getName,mtkValue-method
###   getValue,mtkValue-method getType,mtkValue-method
###   setName,mtkValue,character-method setValue,mtkValue,ANY-method
###   setValue,mtkValue-method setType,mtkValue,character-method
###   show,mtkValue-method print,mtkValue-method

### ** Examples

# Create a  new object of 'mtkValue'
d <- mtkValue("a", "double", c(0,1))
getType(d) # gives "double"
getName(d) # gives "a"
getValue(d) # gives (0, 1)

setType(d, 'character')
getValue(d) # gives ("0", "1")

setValue(d, "3.14")
getValue(d) # gives "3.14"



