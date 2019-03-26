library(physiology)


### Name: ett_size_by_age
### Title: Estimate appropriate size of endotracheal tube for infants and
###   children
### Aliases: ett_size_by_age

### ** Examples

teenagers <- ett_size_by_age(13:18)
plot(13:18, teenagers,
  main = "This formula for ETT tube size overestimates tube
  sizes of teenagers, and takes no account of gender")
lines(13:18, teenagers)
ages <- c(1/12, 1, 2, 4, 7, 11)
neonate_to_child <- ett_size_by_age(age = ages)
names(neonate_to_child) <- ages
print(neonate_to_child)
plot(ages, neonate_to_child)
lines(ages, neonate_to_child)
plot(ages, neonate_to_child, log = "x")
lines(ages, neonate_to_child)



