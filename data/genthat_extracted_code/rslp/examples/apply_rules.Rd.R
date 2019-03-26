library(rslp)


### Name: apply_rules
### Title: Apply rules
### Aliases: apply_rules

### ** Examples

steprules <- readRDS(system.file("steprules.rds", package = "rslp"))
rslp:::apply_rules("balões", name = "Plural", steprules)
rslp:::apply_rules("lápis", name = "Plural", steprules)
rslp:::apply_rules("bolas", name = "Plural", steprules)




