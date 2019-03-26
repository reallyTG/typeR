library(OpasnetUtils)


### Name: DecisionTableParser
### Title: Parse data.frame for decisions
### Aliases: DecisionTableParser

### ** Examples

modeldecisions <- data.frame(Stakeholder = "Group A", Decision = "More wind power", 
  Option = "A few more turbines", Variable = "PowerGeneration", Cell = "Type:Wind", 
  Change = "Add", Result = "5")
DecisionTableParser(modeldecisions)
ls()



