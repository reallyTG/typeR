library(provenance)


### Name: CLR
### Title: Centred logratio transformation
### Aliases: CLR CLR.default CLR.compositional

### ** Examples

# The following code shows that applying provenance's PCA function
# to compositional data is equivalent to applying R's built-in
# princomp function to the CLR transformed data.
data(Namib)
plot(PCA(Namib$Major))
dev.new()
clrdat <- CLR(Namib$Major)
biplot(princomp(clrdat))



