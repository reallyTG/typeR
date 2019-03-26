library(rAmCharts)


### Name: initialize,Label-method
### Title: Initializes Label
### Aliases: initialize,Label-method label setBold
###   setBold,Label,logical-method setText,Label,character-method setX
###   setX,Label,numericOrCharacter-method setY
###   setY,Label,numericOrCharacter-method

### ** Examples

# --- method initialize
new("Label", x = 10)

# --- constructor
label(text = "bonjour")
label(text = "Male", x = "28%", y = "97%")

# --- update property 'bold'
setBold(.Object = label(), bold = TRUE)

# --- update 'text'
setText(.Object = label(), text = "Bonjour")

# --- update 'x'
setX(.Object = label(), x = 16)

# --- update 'y'
setY(.Object = label(), y = 16)




