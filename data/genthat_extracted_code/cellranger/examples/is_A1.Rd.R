library(cellranger)


### Name: is_A1
### Title: Test cell reference strings
### Aliases: is_A1 is_R1C1

### ** Examples

is_A1("A1")
is_R1C1("A1")
is_R1C1("R4C12")

x <- c("A1", "$A4", "$b$12", "RC1", "R[-4]C9", "R5C3")
data.frame(x, is_A1(x), is_R1C1(x))



