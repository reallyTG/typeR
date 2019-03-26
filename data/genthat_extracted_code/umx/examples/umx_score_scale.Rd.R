library(umx)


### Name: umx_score_scale
### Title: Score a scale by summing normal and reversed items
### Aliases: umx_score_scale

### ** Examples

library(psych)
tmp = umx_score_scale("A", pos = 1:3, rev = 4:5, max = 6, data= bfi, name = "A")
tmp = umx_score_scale("E", pos = c(3,4,5), rev = c(1,2), max = 6, data= bfi, name = "E")

# Using @BillRevelle's psych package: More diagnostics.
scores= psych::scoreItems(list(E= c("-E1","-E2","E3","E4","E5")), bfi, min = 1, max = 6)
summary(scores)
print(scores)

# Compare output (note, scoreItems replaces NAs with the sample median by default...)
all(as.numeric(scores$scores)*5 ==tmp[,"E"], na.rm = TRUE)




