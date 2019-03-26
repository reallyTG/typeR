library(semPLS)


### Name: hanafi2007
### Title: Hanafi (2007): Example Data
### Aliases: hanafi2007

### ** Examples

### get the Data from Hanafi's Example
data(hanafi2007)
hanafi2007

### 1st Example: the 11 MVs relate to formative 3 LVs
Ex1mfrom <- names(hanafi2007)
Ex1mto <- paste("z", c(rep(1:3, each=3), 3, 3), sep="")
Ex1mm <- cbind(source=Ex1mfrom, target=Ex1mto)

Ex1sfrom <- paste("z", 1:2, sep="")
Ex1sto <- paste("z", 2:3, sep="")
Ex1sm <- cbind(source=Ex1sfrom, target=Ex1sto)

library(semPLS)
EX1 <- plsm(data=hanafi2007, strucmod=Ex1sm, measuremod=Ex1mm)

ex1A <- sempls(model=EX1, data=hanafi2007, E="A", maxit=100, tol=1e-7)

# for the centroid scheme criterion f is used:
matplot(ex1A$Hanafi[,"iteration"], 2*ex1A$Hanafi[,"f"],
        type="b", lty=1, pch=3,
        xlim=c(0, 29), ylim=c(0, 3.5),
        main="Hanafi 2007: Example 1\ncentroid scheme",
        ylab="Criterion f", xlab="Iteration")

legend(x=17, y=0.5, legend="Lohm{\"o}ller's procedure", lty=1, pch=3)

# check the evolution of outer weights 
plot(ex1A, xlim=c(0, 30))


# Now the same using factorial scheme:
ex1B <- sempls(model=EX1, data=hanafi2007, E="B", maxit=100, tol=1e-7)

# for the factorial scheme criterion g is used:
matplot(ex1B$Hanafi[,"iteration"], 2*ex1B$Hanafi[,"g"],
        type="b", lty=1, pch=3,
        xlim=c(0, 29), ylim=c(0, 3),
        main="Hanafi 2007: Example 1\nfactorial scheme",
        ylab="Criterion g", xlab="Iteration")

legend(x=17, y=0.5, legend="Lohm{\"o}ller's procedure", lty=1, pch=3)


### 2nd Example: the 11 MVs relate to 5 formative LVs
# renaming of the variables
names(hanafi2007) <- paste("x", rep(1:5, c(2, 2, 2, 2, 3)), c(rep(1:2, 5), 3), sep="")
Ex2mfrom <- names(hanafi2007)
Ex2mto <- paste("z", c(rep(1:5, each=2), 5), sep="")
Ex2mm <- cbind(source=Ex2mfrom, target=Ex2mto)

Ex2sfrom <- paste("z", rep(1:4, 4:1), sep="")
Ex2sto <- paste("z", c(2:5, 3:5, 4:5, 5), sep="")
Ex2sm <- cbind(source=Ex2sfrom, target=Ex2sto)

EX2 <- plsm(data=hanafi2007, strucmod=Ex2sm, measuremod=Ex2mm)

# this time only for the centroid scheme with criterion f:
ex2A <- sempls(model=EX2, data=hanafi2007, E="A", maxit=100, tol=1e-7)
matplot(ex2A$Hanafi[,"iteration"], 2*ex2A$Hanafi[,"f"],
        type="b", lty=1, pch=3,
        xlim=c(0, 10), ylim=c(0, 12),
        main="Hanafi 2007: Example 2\ncentroid scheme",
        ylab="Criterion f", xlab="Iteration")

legend(x=6, y=1.5, legend="Lohm{\"o}ller's procedure", lty=1, pch=3)

# check the evolution of outer weights 
plot(ex2A, xlim=c(0, 10))



