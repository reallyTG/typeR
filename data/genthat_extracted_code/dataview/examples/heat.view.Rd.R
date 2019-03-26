library(dataview)


### Name: heat.view
### Title: Display heatmaps and heatvectors.
### Aliases: heat.view

### ** Examples

data(iris)
heat.view(iris$Species)
heat.view(matrix(iris$Petal.Width, 3, 50, byrow=TRUE,
                 dimnames=list(levels(iris$Species), NULL)), pal="purples")

run.status <- factor(runif(100) < .95, labels=c("Fail", "Pass"))
heat.view(run.status, pal=1:2)

#Tip for displayig the element names of a named vector:
a <- runif(7)
names(a) <- c("ATM", "CHK1", "CDC25", "p53", "CDC2", "CDK2", "CDK4")
heat.view(a)            # No names displayed
heat.view(as.matrix(a)) # Names displayed



