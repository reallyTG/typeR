library(EngrExpt)


### Name: urine
### Title: Mercury level in employee urine samples
### Aliases: urine
### Keywords: datasets

### ** Examples

str(urine)
dotplot(month ~ person1 + person2 + person3 + person4, urine,
        outer = FALSE, type = c("p","l"),
        auto.key = list(columns = 2, lines = TRUE, points = FALSE),
        xlab = "Mercury level in urine")



