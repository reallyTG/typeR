library(vcd)


### Name: doubledecker
### Title: Doubledecker Plot
### Aliases: doubledecker.default doubledecker.formula doubledecker
### Keywords: hplot

### ** Examples

data("Titanic")
doubledecker(Titanic)
doubledecker(Titanic, depvar = "Survived")
doubledecker(Survived ~ ., data = Titanic)



