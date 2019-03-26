library(relations)


### Name: classes
### Title: Relation Equivalence Classes
### Aliases: relation_class_ids relation_classes
### Keywords: math

### ** Examples

## Equivalence.
f <- factor(rep(c("Good", "Bad", "Ugly"), c(3, 2, 1)))
R <- as.relation(f)
relation_is(R, "equivalence")
table(ids = relation_class_ids(R), orig = f)

relation_classes(R)

## Weak order ("weak preference").
f <- ordered(f, levels = c("Ugly", "Bad", "Good"))
R <- as.relation(f)
relation_is(R, "weak_order")
table(ids = relation_class_ids(R), orig = f)

relation_classes(R)



