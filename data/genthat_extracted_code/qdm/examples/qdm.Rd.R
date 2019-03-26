library(qdm)


### Name: qdm
### Title: Fit a Quadrilateral Dissimilarity Model
### Aliases: qdm

### ** Examples

## prepare data
data(FMrate)
psi1 <- psi(FMrate[FMrate$id == "subj1",])

## estimate model
p.s <- c(.2, .5, .1, .5, .3, .1, .1, .1)
q1 <- qdm(psi1, start=p.s)
print(q1)

## model predictions
predict(q1)
persp(q1)



