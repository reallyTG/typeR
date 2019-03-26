library(Familias)


### Name: FamiliasPedigree
### Title: Creates an object storing a pedigree.
### Aliases: FamiliasPedigree

### ** Examples

#A nuclear family of three: 
ped <- FamiliasPedigree(c("mother", "father", "child"), 
                        c(NA, NA, "father"), 
                        c(NA, NA, "mother"), 
                        c("female", "male", "female"))
plot(ped, symbolsize = 2, cex = 2, family = "mono")

#Generating the two pedigrees needed for a traditional paternity case
ped1 <- FamiliasPedigree(c("mother", "child", "AF"), 
                         c(NA, NA, NA), 
                         c(NA, "mother", NA), 
                         c("female", "female", "male"))
ped2 <- FamiliasPedigree(c("mother", "child", "AF"), 
                         c(NA, "AF", NA), 
                         c(NA, "mother", NA), 
                         c("female", "female", "male"))

#Generating the two pedigrees needed for a duo case
ped1 <- FamiliasPedigree(c("child", "AF"), c(NA, NA), c(NA, NA), c("male", "male"))
ped2 <- FamiliasPedigree(c("child", "AF"), c("AF", NA), c(NA, NA), c("male", "male"))



