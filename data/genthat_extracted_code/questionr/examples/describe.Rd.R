library(questionr)


### Name: describe
### Title: Describe the variables of a data.frame
### Aliases: describe describe.factor describe.numeric describe.character
###   describe.default describe.labelled describe.data.frame
###   print.description

### ** Examples

data(hdv2003)
describe(hdv2003$sexe)
describe(hdv2003$age)
data(fecondite)
describe(femmes$milieu)
describe(hdv2003)
describe(hdv2003, "cuisine", "heures.tv")
describe(hdv2003, "trav*")
describe(hdv2003, "trav|lecture")
describe(hdv2003, "trav", "lecture")
describe(femmes)
describe(femmes, "ident")



