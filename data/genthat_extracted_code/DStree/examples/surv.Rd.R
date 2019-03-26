library(DStree)


### Name: surv
### Title: Print fitted Survival and Hazard Probabilites of a DStree Object
### Aliases: surv

### ** Examples

# Grow tree
tree <- DStree(spell~ui+age,status="censor1",data=UnempDur)

# Print fitted probabilites
surv(tree)



