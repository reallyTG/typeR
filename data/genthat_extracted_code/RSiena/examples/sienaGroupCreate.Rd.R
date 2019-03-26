library(RSiena)


### Name: sienaGroupCreate
### Title: Function to group together several Siena data objects
### Aliases: sienaGroupCreate sienaGroup
### Keywords: classes

### ** Examples

Group1 <- sienaDependent(array(c(N3401, HN3401), dim=c(45, 45, 2)))
Group3 <- sienaDependent(array(c(N3403, HN3403), dim=c(37, 37, 2)))
Group4 <- sienaDependent(array(c(N3404, HN3404), dim=c(33, 33, 2)))
Group6 <- sienaDependent(array(c(N3406, HN3406), dim=c(36, 36, 2)))
dataset.1 <- sienaDataCreate(Friends = Group1)
dataset.3 <- sienaDataCreate(Friends = Group3)
dataset.4 <- sienaDataCreate(Friends = Group4)
dataset.6 <- sienaDataCreate(Friends = Group6)
FourGroups <- sienaGroupCreate(list(dataset.1, dataset.3, dataset.4, dataset.6))



