library(rcompanion)


### Name: scheirerRayHare
### Title: Scheirer Ray Hare test
### Aliases: scheirerRayHare

### ** Examples

### Example from Sokal and Rohlf, 1995.
Value = c(709,679,699,657,594,677,592,538,476,508,505,539)
Sex   = c(rep("Male",3), rep("Female",3), rep("Male",3), rep("Female",3))
Fat   = c(rep("Fresh", 6), rep("Rancid", 6))
Sokal = data.frame(Value, Sex, Fat)

scheirerRayHare(Value ~ Sex + Fat, data=Sokal)
                                                             



