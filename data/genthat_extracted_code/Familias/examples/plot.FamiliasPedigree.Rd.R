library(Familias)


### Name: plot.FamiliasPedigree
### Title: Plotting function for FamiliasPedigree objects
### Aliases: plot.FamiliasPedigree
### Keywords: ~kwd1 ~kwd2

### ** Examples

##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.
ped <- FamiliasPedigree(id = c("child", "AF"), momid = c(NA, NA), 
       dadid = c("AF", NA), sex = c("male", "male"))
plot(ped)
dev.new()
plot(ped, symbolsize = 2, cex = 2, family = "mono")



