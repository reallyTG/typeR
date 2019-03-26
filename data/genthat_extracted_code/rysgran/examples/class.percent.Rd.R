library(rysgran)


### Name: class.percent
### Title: Weight Percentages of Textural Classes
### Aliases: class.percent

### ** Examples

#testing the different modes

library(rysgran)
data(camargo2001)

class.percent(camargo2001, mode="total", empty.col=FALSE, lang="en-US")

class.percent(camargo2001, mode="classes", empty.col=FALSE, lang="en-US")

class.percent(camargo2001, mode="both", empty.col=FALSE, lang="en-US")



